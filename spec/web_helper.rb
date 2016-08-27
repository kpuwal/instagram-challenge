require 'rails_helper'

def sign_up(email: 'poster@example.com', password: 'testtest', password_confirmation: 'testtest' )

  visit '/users/sign_up'
	fill_in('Email', with: email)
	fill_in('Password', with: password, match: :prefer_exact)
	fill_in('Password confirmation', with: password_confirmation, match: :prefer_exact)
	click_button('Sign up')
end


def sign_in(email: 'poster@example.com', password: 'testtest')
	visit '/users/sign_in'
	fill_in('Email', with: email)
	fill_in('Password', with: password)
	click_button('Log in')
end

def new_picture
	visit '/'
	click_on 'New Picture'
  visit '/pictures/new'
	fill_in('Title', with: 'The Armadillo')
  fill_in('Description', with: 'This is the time of year when almost every night the frail, illegal fire balloons appear.')
	attach_file('Image', Rails.root + "spec/fixtures/test_image.jpg")
	click_on 'Create Picture'
end
