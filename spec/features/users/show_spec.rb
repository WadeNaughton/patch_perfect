require 'rails_helper'

RSpec.describe 'User show page' do
  it "has link to go to home page" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    visit "/users/#{user.id}"
    expect(page).to have_link("Home")
    click_link("Home")
    expect(current_path).to eq('/')

  end
  it "has users name displayed" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    visit "/users/#{user.id}"
    expect(page).to have_content("wade wade")
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
end
