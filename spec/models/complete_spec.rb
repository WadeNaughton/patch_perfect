require 'rails_helper'

RSpec.describe Complete, type: :model do
  describe 'relations' do
    it {should belong_to(:user)}
    it {should belong_to(:hike)}

    it {should have_many(:comments)}
    it {should have_many(:complete_gears)}
    it {should have_many(:user_gears).through(:complete_gears)}
    it {should have_many(:participants)}
    it {should have_many(:users).through(:participants)}
    it {should have_many(:guest_costs).through(:participants)}
    it {should have_many(:costs)}
    it {should have_many(:participant_comments).through(:participants)}


  end
  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:hike_id)}
  end

  describe 'model method' do
    it "totals sum of gear weight" do
      user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
      user_gear = user.user_gears.create!(name: 'tent', pounds: 4.5)
      user_gear2 = user.user_gears.create!(name: 'sleeping bag', pounds: 5)
      hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
      complete = Complete.create!(hike_id: hike.id, user_id: user.id)
      gear = CompleteGear.create!(complete_id: complete.id, user_gear_id: user_gear.id)
      gear2 = CompleteGear.create!(complete_id: complete.id, user_gear_id: user_gear2.id)
      expect(complete.total_weight).to eq(9.5)
    end
  end

  it "totals sum of costs" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
   
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    complete = Complete.create!(hike_id: hike.id, user_id: user.id)
    cost = Cost.create!(complete_id: complete.id, user_id: user.id, item: 'food', price: 20)
    cost2 = Cost.create!(complete_id: complete.id,user_id: user.id, item: 'foo2', price: 10)
    expect(complete.total_cost).to eq(30)
  end

  it "totals sum of guest costs" do
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    user2 = User.create!(first_name: 'wade2', last_name: 'wade', username: "wade", email:"wade2@bob.com", password: "test", password_confirmation: "test")
    hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    complete = Complete.create!(hike_id: hike.id, user_id: user.id)
    participant = Participant.create!(complete_id: complete.id, user_id: user2.id)
    guest_cost = GuestCost.create!(participant_id: participant.id, item: 'food', price: 20)
    guest_cost2 = GuestCost.create!(participant_id: participant.id, item: 'food', price: 10)
    expect(complete.total_guest_cost).to eq(30)

  end
end
