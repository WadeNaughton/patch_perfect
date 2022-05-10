require 'rails_helper'

RSpec.describe 'welcome index page' do
  describe 'view' do
    it "has link to create new user" do
      visit ("/")

      click_link('Create a New User')
      expect(current_path).to eq('/register')
    end
    it "has link to discover hikes" do
      visit ("/")

      click_link('Discover Hikes')
      expect(current_path).to eq('/hikes')
    end
    it "has link to login" do
      visit ("/")

      click_link('Login')
      expect(current_path).to eq('/login')
    end
  end
end
