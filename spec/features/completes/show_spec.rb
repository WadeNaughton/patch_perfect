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

  it "has link to add a journal entry and button to delete comment" do
    visit("/users/#{@user.id}/hikes/#{@hike2.id}/complete")
    expect(page).to have_button("Add Entry")
    click_button("Add Entry")
    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/comment/new")

    fill_in("body", with: "test")
    click_button("Submit")
    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/complete")

 

  end
  it "has link to add gear and delete gear" do

    visit("/users/#{@user.id}")

    click_link("Add Gear to The Shed")

    expect(current_path).to eq("/users/#{@user.id}/gear/new")

    fill_in("Name", with: "Tent")
    fill_in("Pounds", with: 5.0)
    fill_in("Ounces", with: 5)

    click_button("Submit")


    visit("/users/#{@user.id}/hikes/#{@hike2.id}/complete")

    expect(page).to have_link("Add Gear Used")

    click_link("Add Gear Used")

    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/gear/new")

    select("Tent", :from => "user_gear_id")

    click_button("Add From Shed")

    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/complete")

    expect(page).to have_content("Name: Tent")
    expect(page).to have_content("Weight: 5.0 lbs 5 oz")

    expect(page).to have_button("Delete Item")

    click_button("Delete Item")

    expect(page).to_not have_content("Name: tent")
    expect(page).to_not have_content("Weight: 5.0 lbs 5 oz")

  end

  it "calculates total weight" do

    visit "/users/#{@user.id}"

    click_link("Add Gear to The Shed")

    expect(current_path).to eq("/users/#{@user.id}/gear/new")

    fill_in("Name", with: "Tent")
    fill_in("Pounds", with: 5.0)
    

    click_button("Submit")

    click_link("Add Gear")

    fill_in("Name", with: "Tent2")
    fill_in("Pounds", with: 5.0)
    

    click_button("Submit")

    visit("/users/#{@user.id}/hikes/#{@hike2.id}/complete")

    expect(page).to have_link("Add Gear Used")

    click_link("Add Gear Used")

    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/gear/new")

    select("Tent2", :from => "user_gear_id")

    click_button("Add From Shed")

    click_link("Add Gear Used")

    select("Tent2", :from => "user_gear_id")

    click_button("Add From Shed")

    expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/complete")

    expect(page).to have_content("10.0 lbs")

  end
end
