require 'rails_helper'

RSpec.describe 'user create' do
  
    it ' has a form that filled out and creates new user' do
    visit("/register")
    fill_in('First name', with: 'wade')
    fill_in('Last name', with: 'wade')
    fill_in('Username', with: 'wade')
    fill_in('Email', with: 'wade@wade.com')
    fill_in('Password', with: 'test')
    fill_in('Password confirmation', with: 'test')
    click_button('Submit')
    expect(current_path).to eq("/users/#{User.last.id}")

   
  end
end
