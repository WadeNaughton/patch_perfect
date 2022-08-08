class RecreationService
    def self.connection
      url = "https://ridb.recreation.gov/api/v1/facilities?"
      Faraday.new(url: url) do |faraday|
        faraday.params['apikey'] = ENV['recreation_key']
      end
    end
  
    def self.get_campgrounds(lat,lon)
  
      response = connection.get do |faraday|
        faraday.params['latitude'] = lat
        faraday.params['longitude'] = lon
        faraday.params['radius'] = 20
        faraday.params['activity'] = 9
        faraday.params['query'] = 'Campground'
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  
  end