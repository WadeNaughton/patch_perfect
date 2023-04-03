require 'rails_helper'

RSpec.describe HikeFacade do
    it ".forecast" do
        hikes = HikeFacade.get_hikes
        # binding.pry
        expect(hikes).to be_a Array
        expect(hikes.first).to be_a Hike
    end
 end