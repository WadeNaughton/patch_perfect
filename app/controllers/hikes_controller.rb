class HikesController < ApplicationController



  def index
    @hikes = Hike.all
    @user = User.find_by(id: session[:user_id])
    if params[:prominence].present?
      @hikes = Hike.all.prominence.page(params[:page])
    elsif params[:elevation].present?
      @hikes = Hike.all.elevation.page(params[:page])
    elsif params[:location].present?
      @hikes= Hike.all.location.page(params[:page])
    elsif params[:hike_name].present?
      @hikes = Hike.all.hike_name.page(params[:page])
    elsif params[:range].present?
      @hikes = Hike.all.range.page(params[:page])  
    else
      @hikes = Hike.all.page(params[:page])
    end
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
