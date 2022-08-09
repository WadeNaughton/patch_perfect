require 'rails_helper'

RSpec.describe ForecastFacade do
    it ".forecast", :vcr do
        lat = 44.270278
        lon = -71.303611
        forecast = ForecastFacade.get_forecast(lat,lon)
        expect(forecast).to be_a Hash
    end
 end