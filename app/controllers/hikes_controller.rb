class HikesController < ApplicationController

  def index
    hikez = HikeFacade.get_hikes
    @user = User.find_by(id: session[:user_id])

    @hikes = Kaminari.paginate_array(hikez).page(params[:page])
    if params[:prominence].present?
      @hikes = Kaminari.paginate_array(HikeFacade.get_ordered_hike_prominence).page(params[:page])
    elsif params[:elevation].present?
      @hikes = Kaminari.paginate_array(HikeFacade.get_ordered_hike_elevation).page(params[:page])
    elsif params[:location].present?
      @hikes = Kaminari.paginate_array(hikez.sort_by{|e| e[:location]}).page(params[:page])
    elsif params[:name].present?
      @hikes = Kaminari.paginate_array(hikez.sort_by{|e| e[:name]}).page(params[:page])
    elsif params[:range].present?
      @hikes = Kaminari.paginate_array(hikez.sort_by{|e| e[:range]}).page(params[:page])
   
    end
  end

  def show

      if Hike.where(id: params[:id]).empty?
        @hike = HikeFacade.get_hike(params[:id])
        @hike.save
      else
        @hike = Hike.find(params[:id])
      end
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
    @campgrounds = camps[:RECDATA]
    @count = camps[:METADATA][:RESULTS][:CURRENT_COUNT]   

  end



  def search
    search = params[:search]
    @user = User.find_by(id: session[:user_id])

    if HikeFacade.find_hike(search).nil?
      flash.now.alert = "Hike not found"
    else 
      hikez = HikeFacade.find_hike(search)
      @hike_result = Kaminari.paginate_array(hikez).page(params[:page])
    end
   


  end

  private
  def hike_params
    params.permit(:name, :elevation, :prominence, :state, :location, :range, :features, :latitude, :longitude, :page, :radius)
  end
end
