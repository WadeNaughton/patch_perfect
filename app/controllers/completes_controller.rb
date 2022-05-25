class CompletesController < ApplicationController

  def show
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    @gear_used = @complete.gears.all
    @total_weight = @complete.total_weight
  end

  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    complete = Complete.find_or_create_by(hike_id: @hike.id, user_id: @user.id)
  end

  # def edit
  #   @hike = Hike.find(params[:id])
  #   @user = User.find_by(id: params[:user_id])
  #   @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  # end

  # def update
  #   @hike = Hike.find(params[:id])
  #   @user = User.find_by(id: params[:user_id])
  #   @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  #   redirect_to "/users/#{@user.id}"
  #
  #   ##cannot figure out how to fucking upload and store image to complete table
  #
  # end





end
