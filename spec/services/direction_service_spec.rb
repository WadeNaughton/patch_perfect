
require 'rails_helper'
require 'pry'

RSpec.describe DirectionService do
  it "returns directions information", :vcr do
    lat = 44.270278
    lng = -71.303611
    origin = "boston,ma"
    destination = "#{lat},#{lng}"
    search = DirectionService.get_directions(origin,destination)
    binding.pry
    expect(search).to be_a Hash
  end
end