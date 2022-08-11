class MapService
    def self.connection
        url = "https://maps.googleapis.com/maps/api/staticmap"
        Faraday.new(url: url) do |faraday|
          faraday.params['key'] = ENV['google_key']
        end
    end


    def self.get_map(center)
        response = connection.get do |faraday|
            faraday.params["center"]=center
            faraday.params["size"]="400x300"
            faraday.params["zoom"]=15
            faraday.headers["Content-Type"] = "image/png" 
            # binding.pry

        end

        JSON.parse(response.body, symbolize_names: true)

    end

    # def self.get_map(center)

    #     response = connection.get("center=#{center}&size=300x300&zoom=17")
    #     JSON.parse(response.body, symbolize_names: true)

    # end
end
