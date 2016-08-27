require 'rails_helper'

feature 'No pictures yet' do

  context 'have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures#index'
      expect(page).to have_content('No Pictures added yet!')
    end
  end
end

feature 'Picture' do

  before do
    sign_up
    new_picture
  end

  context 'can be created' do

    scenario 'should have a file attached' do
      expect(page).to have_selector('img')
    end

    scenario 'should display pictures title on the front page' do
      expect(page).to have_content 'The Armadillo'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'Successfully created new Picture'
    end

    scenario 'should display a picture on the show page' do
      click_link 'The Armadillo'
      expect(page).to have_selector('img')
    end

    scenario 'should display pictures description on the show page' do
      click_link 'The Armadillo'
      expect(page).to have_content 'This is the time of year when almost every night the frail, illegal fire balloons appear.'
    end
  end

  context 'can be edited' do
    scenario 'user should be able to edit a picture' do
      click_link 'The Armadillo'
      expect(page).to have_link('Edit')

      click_link('Edit')
      fill_in('Title', with: 'The New Armadillo')
      click_button('Update Picture')
      expect(page).to have_content('The New Armadillo')
    end
  end

  context 'can be deleted' do
    scenario 'user should be able to delete a picture' do
      click_link 'The Armadillo'
      expect(page).to have_link('Delete')

      click_link('Delete')
      expect(page).not_to have_content('The New Armadillo')
      expect(page).to have_content 'Picture deleted successfully'

    end
  end
end
