require 'rails_helper'

feature 'Endorsing Pictures' do
  before do
    sign_up
    new_picture
    sign_out
    sign_up_user2
  end

  context 'for logged in user' do
    scenario 'can endorse a picture, which updates endorsement count', js: true do
      click_link 'The Armadillo'
      click_link 'Endorse'
      expect(page).to have_content('1 endorsement')
    end
  end
end
