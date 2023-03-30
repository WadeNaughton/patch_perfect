class HikeService
    def self.connection
      url = "http://localhost:3000"
      Faraday.new(url: url) 
    end
  
    def self.get_hikes
  
      response = connection.get('/api/v1/hikes')
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.get_hike(id)
      response = connection.get("/api/v1/hikes/#{id}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.find_hike(search)
      response = connection.get("/api/v1/search?search=#{search}")
      JSON.parse(response.body, symbolize_names: true)
    end



  
  end