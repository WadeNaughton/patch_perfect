class DirectionService

    def self.connection
        url = "https://maps.googleapis.com/maps/api/directions/json?"
        Faraday.new(url: url) do |faraday|
          faraday.params['key'] = ENV['google_key']
        end
      end

    def self.get_directions(origin, destination)
        response = connection.get do |faraday|
            faraday.params["origin"]= origin
            faraday.params["destination"]=destination
            
        end
        JSON.parse(response.body, symbolize_names: true)

    end




end