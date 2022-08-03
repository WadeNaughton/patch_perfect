
require 'rails_helper'
require 'pry'

RSpec.describe ForecastService do
  it "returns weather data", :vcr do
    lat = 44.270278
    lng = -71.303611
    search = ForecastService.get_forecast(lat,lng)
    expect(search).to be_a Hash
  end
end