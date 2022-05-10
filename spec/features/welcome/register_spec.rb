require 'rails_helper'

RSpec.describe 'Welcome Register Page' do
  describe 'register view page' do
    it "has a form that is filled out and take you to new user show page" do
      visit "/register"

    fill_in('First name', with: 'bob')
    fill_in('Last name', with: 'bill')
    fill_in('Email', with: "Marco_polo@gmail.com")
    fill_in('Password', with: 'test')
    fill_in('Password confirmation', with: 'test')
    fill_in('Username', with: 'test')

    click_button('Submit')
    user = User.all.last
    expect(current_path).to eq("/users/#{user.id}")
    end
    it "returns to register page when a filled is missed" do
      visit "/register"

    fill_in('First name', with: '')
    fill_in('Last name', with: 'bill')
    fill_in('Email', with: "Marco_polo@gmail.com")
    fill_in('Password', with: 'test')
    fill_in('Password confirmation', with: 'test')
    fill_in('Username', with: 'test')

    click_button('Submit')

    expect(current_path).to eq("/register")
    end
  end
end
