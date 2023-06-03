require 'rails_helper'

RSpec.describe 'hike index page' do
  before do
    @user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    @hike = Hike.create!(name: 'hike', elevation: 4001, prominence: 201, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls",latitude: 44.270278, longitude: -71.303611)
    @hike2 = Hike.create!(name: 'new hike', elevation: 4002, prominence: 202, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls",latitude: 44.270278, longitude: -71.303611)
    @hike3 = Hike.create!(name: 'Adams', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Presidential Range', features: "waterfalls",latitude: 44.270278, longitude: -71.303611)
    @hike4 = Hike.create!(name: 'Washington', elevation: 4003, prominence: 203, state: 'NH', location: 'Pinkham\'s Grant', range: 'Presidential Range', features: "waterfalls",latitude: 44.270278, longitude: -71.303611)

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

  it "shows ordered hikes by elevation" do
    visit "/users/#{@user.id}/discover"
    expect(page).to have_content("Washington")
    click_link("Elevation")
    expect(page.body.index("Washington")).to be < page.body.index("Adams")
  end

  it "shows ordered hikes by prominence" do
    visit "/users/#{@user.id}/discover"
    expect(page).to have_content("Washington")
    click_link("Prominence")
    expect(page.body.index("Washington")).to be < page.body.index("Lafayette")
    expect(page.body.index("Lafayette")).to be < page.body.index("Moosilauke")
  end

  it "shows ordered hikes by name" do
    visit "/users/#{@user.id}/discover"
    click_link("Name")
    expect(page.body.index("Adams")).to be < page.body.index("Bond")
    expect(page.body.index("Bond")).to be < page.body.index("Bondcliff")
  end

  it "shows ordered hikes by location" do
    visit "/users/#{@user.id}/discover"
    click_link("Location")
    expect(page.body.index("Moosilauke")).to be < page.body.index("Cabot")
    expect(page.body.index("Cabot")).to be < page.body.index("Hale")
  end

  it "shows ordered hikes by range" do
    visit "/users/#{@user.id}/discover"
    click_link("Range")
    expect(page.body.index("Wildcat, D Peak")).to be < page.body.index("Middle Carter")
    expect(page.body.index("Middle Carter")).to be < page.body.index("Carter Dome")
  end


end


