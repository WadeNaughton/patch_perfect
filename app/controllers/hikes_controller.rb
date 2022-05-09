class HikesController < ApplicationController

  def index
    @hikes = Hike.all
  end

  def show
    @hike = Hike.find(params[:id])
  end

  private
  def hike_params
    params.permit(:name, :elevation, :prominence, :state, :location, :range, :features)
  end
end
