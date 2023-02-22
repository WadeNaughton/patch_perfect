require 'rails_helper'

RSpec.describe 'hike index page' do
  before do
    @user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    @hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls",latitude: 44.270278, longitude: -71.303611)
    @hike2 = Hike.create!(name: 'new hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls",latitude: 44.270278, longitude: -71.303611)

    @favorite = Favorite.create!(hike_id: @hike.id, user_id: @user.id)
    @complete = Complete.create!(hike_id: @hike2.id, user_id: @user.id)

    visit ("/login")
    fill_in('Email', with: 'wade@bob.com')
    fill_in('Password', with: 'test')
    click_button('Log in')

  end

  it "shows a single hikes data" do
    visit "/users/#{@user.id}/hikes/#{@hike.id}"

    expect(page).to have_content(@hike.name)
    expect(page).to have_content(@hike.location)
    expect(page).to have_content(@hike.state)
    expect(page).to have_content(@hike.range)
    expect(page).to have_content(@hike.elevation)
    expect(page).to have_content(@hike.prominence)
    expect(page).to have_content(@hike.features)
    
    expect(page).to have_button("Unfavorite")
    click_button("Unfavorite")
    visit "/users/#{@user.id}/hikes/#{@hike.id}"

    expect(page).to have_button("Favorite")
    expect(page).to have_button("Completed")
  end

  it "creates a completed hike" do
    visit "/users/#{@user.id}/hikes/#{@hike.id}"
    expect(page).to have_button("Completed")
    click_button("Completed")

    visit "/users/#{@user.id}"

    expect(page).to have_content(@hike.name)
  end
end
