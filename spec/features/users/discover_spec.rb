require 'rails_helper'

RSpec.describe 'discover page' do
  it "has links to each hikes show page" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    hike2 = Hike.create!(name: 'new hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")

    visit "/users/#{user.id}/discover"
    expect(page).to have_link("hike")
    click_link("hike")
    expect(current_path).to eq("/users/#{user.id}/hikes/#{hike.id}")

    visit "/users/#{user.id}/discover"

    expect(page).to have_link("new hike")
    click_link("new hike")
    expect(current_path).to eq("/users/#{user.id}/hikes/#{hike2.id}")
  end

  it "has each hikes details" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    hike2 = Hike.create!(name: 'new hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")

    visit "/users/#{user.id}/discover"

    expect(page).to have_content(hike.name)
    expect(page).to have_content(hike.elevation)
    expect(page).to have_content(hike.prominence)
    expect(page).to have_content(hike.location)
    expect(page).to have_content(hike.state)
    expect(page).to have_content(hike.range)
    expect(page).to have_content(hike.features)

    expect(page).to have_content(hike2.name)
    expect(page).to have_content(hike2.elevation)
    expect(page).to have_content(hike2.prominence)
    expect(page).to have_content(hike2.location)
    expect(page).to have_content(hike2.state)
    expect(page).to have_content(hike2.range)
    expect(page).to have_content(hike2.features)
  end
end
