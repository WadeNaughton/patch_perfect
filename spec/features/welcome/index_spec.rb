require 'rails_helper'

RSpec.describe 'welcome index page' do
  describe 'view' do
    it "has link to create new user" do
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
  end
end
