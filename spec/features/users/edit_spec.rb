require 'rails_helper'

RSpec.describe 'Completed hike show page page' do
    before do
      @user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
      @hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
      @hike2 = Hike.create!(name: 'new hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
  
      @favorite = Favorite.create!(hike_id: @hike.id, user_id: @user.id)
      @complete = Complete.create!(hike_id: @hike2.id, user_id: @user.id)
  
      visit ("/login")
      fill_in('Email', with: 'wade@bob.com')
      fill_in('Password', with: 'test')
      click_button('Log in')
  
    end

    it "edits user" do
        visit("/users/#{@user.id}/edit")
        fill_in("First name", with: "test")
        click_button("Submit")
        expect(page).to have_content("test")
    end

  
end