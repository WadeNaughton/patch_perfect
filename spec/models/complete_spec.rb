require 'rails_helper'

RSpec.describe Complete, type: :model do
  describe 'relations' do
    it {should belong_to(:user)}
    it {should belong_to(:hike)}
    it {should have_many(:comments)}
  end
  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:hike_id)}
  end

  describe 'model method' do
    it "totals sum of gear weight" do
      user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
      hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
      complete = Complete.create!(hike_id: hike.id, user_id: user.id)
      gear = complete.gears.create!(name: 'tent', weight: 4.0)
      gear2 = complete.gears.create!(name: 'bag', weight: 6.0)
      gear3 = complete.gears.create!(name: 'pole', weight: 5.0)
      expect(complete.total_weight).to eq(15.0)
    end
  end
end
