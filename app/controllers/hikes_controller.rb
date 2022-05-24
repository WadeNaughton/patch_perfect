class HikesController < ApplicationController

  def index
    @hikes = Hike.all
  end

  def show

    @hike = Hike.find(params[:id])
  end

  def search
    search = params[:search]
    @user = User.find_by(id: session[:user_id])
    @hike_result = Hike.find_hike(search)
  end

  private
  def hike_params
    params.permit(:name, :elevation, :prominence, :state, :location, :range, :features)
  end
end
