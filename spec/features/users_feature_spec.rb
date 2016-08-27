require 'rails_helper'

feature "User" do
  context "is not signed in and on the homepage" do
    scenario "should see the 'Sign In' and 'Sign Up' link" do
      visit('/')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    scenario "should not see 'Sign Out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
    end
  end

  context "is signed in on the homepage" do

    before do
      sign_up
    end

    scenario "should see 'Sign Out' link" do
      expect(page).to have_link('Sign Out')
    end

    it "should not see the 'Sign In' and 'Sign Up' link" do
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end
  end
end
