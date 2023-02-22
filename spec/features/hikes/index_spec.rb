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

  it "has links to each hikes show page" do


    visit "/users/#{@user.id}/discover"
    expect(page).to have_link("hike")
    click_link("hike")
    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike.id}")

    visit "/users/#{@user.id}/discover"

    expect(page).to have_link("new hike")
    click_link("new hike")
    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}")
  end

  it "has each hikes details" do


    visit "/users/#{@user.id}/discover"

    expect(page).to have_link(@hike.name)

    expect(page).to have_content(@hike.location)
    expect(page).to have_content(@hike.features)
    expect(page).to have_content(@hike.range)


    expect(page).to have_link(@hike2.name)

    expect(page).to have_content(@hike2.location)
    expect(page).to have_content(@hike2.features)
    expect(page).to have_content(@hike2.range)

  end
end
