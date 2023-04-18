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
    expect(page).to have_link("Washington")
    click_link("Washington")
    expect(current_path).to eq("/users/#{@user.id}/hikes/1")

    visit "/users/#{@user.id}/discover"
    expect(page).to have_link("Adams")
    click_link("Adams")
    expect(current_path).to eq("/users/#{@user.id}/hikes/2")
  end

  it "has each hikes details" do


    visit "/users/#{@user.id}/discover"
    
    expect(page).to have_link("Washington")

    expect(page).to have_content("Location: Pinkham's Grant")
    expect(page).to have_content("Features: Waterfalls, Cascades, Brooks, Lakes of the Clouds Hut + Lakes, 360 Degree Views, Peak Bagging")
    expect(page).to have_content("Range: Presidential Range")




  end
end
