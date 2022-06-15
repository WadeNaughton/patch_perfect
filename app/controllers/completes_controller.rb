class CompletesController < ApplicationController

  def show
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    @comments = @complete.comments
    @gear_used = @complete.complete_gears.all
    @total_weight = @complete.total_weight
  end

  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    complete = Complete.find_or_create_by(hike_id: @hike.id, user_id: @user.id)
  end

end
