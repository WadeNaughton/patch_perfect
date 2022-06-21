require 'rails_helper'

RSpec.describe Complete, type: :model do
  describe 'relations' do
    it {should belong_to(:user)}
    it {should belong_to(:hike)}
    it {should have_many(:comments)}
    it {should have_many(:complete_gears)}
  end
  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:hike_id)}
  end

  describe 'model method' do
    it "totals sum of gear weight" do
      user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
      user_gear = user.user_gears.create!(name: 'tent', weight: 4.5)
      user_gear2 = user.user_gears.create!(name: 'sleeping bag', weight: 5)
      hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
      complete = Complete.create!(hike_id: hike.id, user_id: user.id)
      gear = CompleteGear.create!(complete_id: complete.id, user_gear_id: user_gear.id)
      gear2 = CompleteGear.create!(complete_id: complete.id, user_gear_id: user_gear2.id)
      expect(complete.total_weight).to eq(9.5)
    end
  end
end
