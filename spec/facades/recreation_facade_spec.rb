require 'rails_helper'

RSpec.describe RecreationFacade do
    it ".recreation", :vcr do
        lat = 44.270278
        lon = -71.303611
        radius = 10
        campgrounds = RecreationFacade.get_campgrounds(lat,lon,radius)
        expect(campgrounds).to be_a Hash
        expect(campgrounds[:RECDATA]).to be_a Array
    end

    
 end