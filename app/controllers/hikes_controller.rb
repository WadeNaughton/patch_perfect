class HikesController < ApplicationController

  def index
    @hikes = Hike.all
    @user = User.find_by(id: session[:user_id])
  end

  def show

    @hike = Hike.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    forecast = ForecastFacade.get_forecast(@hike.latitude, @hike.longitude)
    @current = forecast[:current]
    @hourly =forecast[:hourly]
    @daily = forecast[:daily]
    camps = RecreationFacade.get_campgrounds(@hike.latitude, @hike.longitude)
    @campgrounds = camps[:RECDATA]
    @count = camps[:METADATA][:RESULTS][:CURRENT_COUNT]    

  end

  def search
    search = params[:search]
    @user = User.find_by(id: session[:user_id])
    @hike_result = Hike.find_hike(search)

    if !@hike_result.exists?
      flash.now.alert = "Hike not found"
    end

  end

  private
  def hike_params
    params.permit(:name, :elevation, :prominence, :state, :location, :range, :features, :latitude, :longitude)
  end
end
