class HikeService
    def self.connection
      url = "https://patch-perfect-db.fly.dev"
      Faraday.new(url: url) 
    end
  
    def self.get_hikes
  
      response = connection.get('/api/v1/hikes')
     test = JSON.parse(response.body, symbolize_names: true)
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