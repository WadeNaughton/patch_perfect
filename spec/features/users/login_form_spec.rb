require 'rails_helper'

RSpec.describe 'login form' do
  describe 'login form view page' do
    it ' has a form that filled out and creates new user' do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    visit ("/login")
    fill_in('Email', with: 'wade@bob.com')
    fill_in('Password', with: 'test')
    click_button('Log in')
    expect(current_path).to eq("/")
  end
  end
end
