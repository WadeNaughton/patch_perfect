require 'rails_helper'

RSpec.describe Hike, type: :model do
  describe 'relations' do
    it {should have_many(:favorites)}
    it {should have_many(:completes)}
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:elevation)}
    it {should validate_presence_of(:prominence)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:range)}
    it {should validate_presence_of(:features)}
  end

  describe 'Class Methods' do
    it "should find hike by partial name or partial feature" do
      
    @hike = Hike.create!(name: 'Bob', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
    @hike2 = Hike.create!(name: 'Bobly', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "grass")
    @hike3 = Hike.create!(name: 'hike search', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls, lakes")

    expect(Hike.find_hike('water')).to include(@hike, @hike3)
    expect(Hike.find_hike('water')).to_not include(@hike2)

    expect(Hike.find_hike('bob')).to include(@hike, @hike2)
    expect(Hike.find_hike('bob')).to_not include(@hike3)

    expect(Hike.find_hike('search')).to include(@hike3)
    expect(Hike.find_hike('search')).to_not include(@hike, @hike2)

    end
  end
end
