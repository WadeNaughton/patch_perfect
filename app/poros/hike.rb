class Hike 

    attr_reader :id, :name, :location, :range, :elevation, :prominence, :latitude, :longitude, :features, :state

    def initialize(data)
        @id = data[:id]
        @hike_name = data[:name]
        @location = data[:location]
        @range = data[:range]
        @elevation = data[:elevation]
        @prominence = data[:prominence]
        @latitude = data[:latitude]
        @longitude = data[:longitude]
        @features = data[:features]
        @state = data[:state]
        binding.pry
    end
end