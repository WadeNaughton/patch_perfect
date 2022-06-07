require 'rails_helper'

RSpec.describe 'welcome index page' do
  describe 'view' do
    it "has link to create new user when not logged in" do
      visit ("/")

      click_link('Create User')

      expect(current_path).to eq('/register')
    end
    it "has link to discover hikes" do
      user = User.create!(first_name: "wade", last_name: "wade", username: "wade", email: "wade@wade.com", password: "test", password_confirmation: "test")
      visit ("/")

      click_link('Login')
      expect(current_path).to eq('/login')
      fill_in "Email", with: "wade@wade.com"
      fill_in "Password", with: "test"
      click_button("Log in")
      expect(current_path).to eq("/")
      click_link('Discover Hikes')
      expect(current_path).to eq("/users/#{user.id}/discover")
    end
    it "has link to login" do
      visit ("/")

      click_link('Login')
      expect(current_path).to eq('/login')
    end

    it "has link to profile page when logged in" do
      user = User.create!(first_name: "wade", last_name: "wade", username: "wade", email: "wade@wade.com", password: "test", password_confirmation: "test")
      visit ("/")

      click_link('Login')
      expect(current_path).to eq('/login')
      fill_in "Email", with: "wade@wade.com"
      fill_in "Password", with: "test"
      click_button("Log in")
      expect(current_path).to eq("/")
      expect(page).to have_link("Profile")
    end

    it "has link to logout when a user is logged in" do
      user = User.create!(first_name: "wade", last_name: "wade", username: "wade", email: "wade@wade.com", password: "test", password_confirmation: "test")
      visit ("/")

      click_link('Login')
      expect(current_path).to eq('/login')
      fill_in "Email", with: "wade@wade.com"
      fill_in "Password", with: "test"
      click_button("Log in")
      expect(current_path).to eq("/")
      expect(page).to have_link("Logout")
    end

    it "does not have links to profile or discover hikes if not logged in" do
      visit ("/")
      expect(page).to_not have_link("Profile")
      expect(page).to_not have_link("Logout")
    end
  end
end
