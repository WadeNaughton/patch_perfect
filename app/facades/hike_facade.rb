class HikeFacade 

    def self.get_hikes
        hikes = HikeService.get_hikes
        test = hikes[:data]
        test.map do |hike|
            new_hike = hike[:attributes]
            Hike.new(new_hike)
        end
        
    end

    def self.get_ordered_hike_elevation
        hikes = HikeService.get_hikes
        test = hikes[:data]
        new = test.map do |hike|
            new_hike = hike[:attributes]
            Hike.new(new_hike)
        end

        new.sort_by{|e| e[:elevation]}.reverse
    end

    def self.get_ordered_hike_prominence
        hikes = HikeService.get_hikes
        test = hikes[:data]
        new = test.map do |hike|
            new_hike = hike[:attributes]
            Hike.new(new_hike)
        end

        new.sort_by{|e| e[:prominence].to_i}.reverse
    end

    def self.get_hike(id)
        hike = HikeService.get_hike(id)
        new_hike = hike[:data][:attributes]
        Hike.new(new_hike)
    end

    def self.find_hike(search)

        hikes = HikeService.find_hike(search)
        if hikes[:data].nil?
            nil
        else
            test = hikes[:data]
            test.map do |hike|
                new_hike = hike[:attributes]
                Hike.new(new_hike)
        
            end
         end
    end
    
    

   

end 