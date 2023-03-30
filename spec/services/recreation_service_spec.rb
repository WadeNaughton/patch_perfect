
require 'rails_helper'
require 'pry'

RSpec.describe RecreationService do
  it "returns camping information" do
    lat = 44.270278
    lng = -71.303611
    radius = 10
    search = RecreationService.get_campgrounds(lat,lng,radius)
    expect(search).to be_a Hash
  end
end