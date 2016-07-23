require 'rails_helper'

feature 'comments' do
  before { Picture.create title: 'sky' }

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment on sky'

    #  fill_in 'Comment', with: 'so so'
    #  check('rating')

     click_button 'Leave a Comment'
     expect(current_path).to eq '/pictures'
    #  expect(page).to have_content('so so')
  end

end
