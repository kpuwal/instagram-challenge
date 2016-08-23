require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link('Add Picture')
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(title: 'sky')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('sky')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating picture' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      user_sign_up
      visit '/pictures'
      click_link 'Add Picture'
      fill_in 'Title', with: 'sky'
      fill_in 'Description', with: 'Deep blue sky'
      click_button 'Create Picture'
      expect(page).to have_content 'sky'
      expect(page).to have_content 'Deep blue sky'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'validating picture submission' do
    it 'does not let you submit a title that is too short' do
      user_sign_up
      visit '/pictures'
      click_link 'Add Picture'
      fill_in 'Title', with: 'kf'
      click_button 'Create Picture'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

  context 'viewing pictures' do

    let!(:sky){ Picture.create(title:'sky', description: 'Deep blue sky') }

    scenario 'lets a user view pictures' do
     visit '/pictures'
     click_link 'sky'
     expect(page).to have_content 'sky'
     expect(page).to have_content 'Deep blue sky'
     expect(current_path).to eq "/pictures/#{sky.id}"
    end
  end

  context 'editing pictures' do
    before { Picture.create title: 'sky' }

    scenario 'let a user edit a picture' do
      user_sign_up
      visit '/pictures'
      click_link 'Edit sky'
      fill_in 'Title', with: 'sky'
      fill_in 'Description', with: 'Deep blue sky'
      click_button 'Update Picture'
      expect(page).to have_content 'sky'
      expect(page).to have_content 'Deep blue sky'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do

    before { Picture.create title: 'sky' }

    scenario 'removes a picture when a user clicks a delete link' do
      user_sign_up
      visit '/pictures'
      click_link 'Delete sky'
      expect(page).not_to have_content 'sky'
      expect(page).to have_content 'Picture deleted successfully'
    end

  end
end
