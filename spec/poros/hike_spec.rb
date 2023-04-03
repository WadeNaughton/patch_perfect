require 'rails_helper'

RSpec.describe Hike do
  it "exists" do
    data =
      {
      attributes:
      {
        name: 'Test',
        location: 'Test',
        range: 'Test',
        elevation: 'Test',
        prominence: 'Test',
        latitude: 'Test',
        longitude: 'Test',
        features: 'Test',
        state: 'Test'



        }
      }

    hike = Hike.new(data)
    expect(hike).to be_a Hike
    expect(hike.name).to eq(data[:attributes][:name])

  end
end