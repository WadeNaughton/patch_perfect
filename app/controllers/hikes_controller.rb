class HikesController < ApplicationController

  def index
    @hikes = Hike.all
    @hikes_kam = @hikes.order(elevation: :desc).page(params[:page])
    @user = User.find_by(id: session[:user_id])
  end

  def show

    @hike = Hike.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    @favorite = Favorite.find_by(user_id: @user.id, hike_id: @hike.id)
    forecast = ForecastFacade.get_forecast(@hike.latitude, @hike.longitude)
    @current = forecast[:current]
    @hourly =forecast[:hourly]
    @daily = forecast[:daily]

    if params[:radius].present? 
      camps = RecreationFacade.get_campgrounds(@hike.latitude, @hike.longitude, params[:radius])
    else
     camps = RecreationFacade.get_campgrounds(@hike.latitude, @hike.longitude, 20)
    end
    # binding.pry
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
    params.permit(:name, :elevation, :prominence, :state, :location, :range, :features, :latitude, :longitude, :page, :radius)
  end
end
