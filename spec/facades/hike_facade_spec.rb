require 'rails_helper'

RSpec.describe HikeFacade do
    it ".forecast" do
        hikes = HikeFacade.get_hikes
        # binding.pry
        expect(hikes).to be_a Array
        expect(hikes.first).to be_a Hike
    end

    it ".get_hike" do
        hike = HikeFacade.get_hike(1)
        expect(hike).to be_a Hike
        expect(hike.name).to eq("Washington")
    end

    it ".find_hike" do
        hike = HikeFacade.find_hike("Washington")
        expect(hike).to be_a Array
        expect(hike.first).to be_a Hike
        expect(hike.first.name).to eq("Washington")
    end

    it ".get_ordered_hike_elevation" do
        hikes = HikeFacade.get_ordered_hike_elevation
        expect(hikes).to be_a Array
        expect(hikes.first).to be_a Hike
        expect(hikes.first.name).to eq("Washington")
    end

    it ".get_ordered_hike_prominence" do
        hikes = HikeFacade.get_ordered_hike_prominence
        expect(hikes).to be_a Array
        expect(hikes.first).to be_a Hike
        expect(hikes.first.name).to eq("Washington")
        expect(hikes.last.name).to eq("Lincoln")
    end
 end