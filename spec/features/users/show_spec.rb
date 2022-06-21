require 'rails_helper'

RSpec.describe 'User show page' do
  
  it "has users name displayed" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    visit "/users/#{user.id}"
    expect(page).to have_content("wade")
  end
  it "has favorited hikes and completed hikes listed" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    hike2 = Hike.create!(name: 'new hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")

    favorite = Favorite.create!(hike_id: hike.id, user_id: user.id)
    complete = Complete.create!(hike_id: hike2.id, user_id: user.id)

    visit "/users/#{user.id}"
    expect(page).to have_content(favorite.hike.name)
    expect(page).to have_content(complete.hike.name)

  end

  it "completed hikes have links to view completed hike page" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    complete = Complete.create!(hike_id: hike.id, user_id: user.id)
    visit "/users/#{user.id}"
    expect(page).to have_content(complete.hike.name)
    expect(page).to have_link("View Hike Details")
    click_link "View Hike Details"
    expect(current_path).to eq("/users/#{user.id}/hikes/#{hike.id}/complete")
  end

  it "displays favorited hikes" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    favorite = Favorite.create!(hike_id: hike.id, user_id: user.id)
    visit "/users/#{user.id}"
    expect(page).to have_content(hike.name)
  end
end
