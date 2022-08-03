class ForecastFacade

    def self.get_forecast(lat,lon)
      test = ForecastService.get_forecast(lat,lon)
    end

    def self.get_hourly_forecast(lat,lon)
        test = ForecastService.get_forecast(lat,lon)
        
        hourly = test
    end
  end
  