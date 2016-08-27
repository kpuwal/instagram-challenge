require 'rails_helper'

feature 'Comment' do

  before do
    sign_up
    new_picture
    sign_out
    sign_up_user2
  end

  context 'can be created' do
    scenario 'allows users to leave comments on other users pictures' do
      click_link 'The Armadillo'
      click_link 'Leave a Comment'
      fill_in 'Comment', with: 'Too pretty, dreamlike mimicry! O falling fire and piercing cry and panic, and a weak mailed fist clenched ignorant against the sky!'
      click_button 'Create Comment'

      expect(page).to have_content 'Too pretty, dreamlike mimicry! O falling fire and piercing cry and panic, and a weak mailed fist clenched ignorant against the sky!'
    end
  end

end
