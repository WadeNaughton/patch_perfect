class CompleteGearsController < ApplicationController

def new
  @hike = Hike.find(params[:id])
  @user = User.find_by(id: params[:user_id])
  @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  @participants = @complete.participants 
  @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)

end

def create
  @hike = Hike.find(params[:id])
  @user = User.find_by(id: session[:user_id])
  @creator = User.find_by(id: params[:user_id])
  @complete = Complete.find_by(hike_id: @hike.id, user_id: @creator.id)
  @usergear = @user.user_gears.find_by(id: params[:user_gear_id])
  @gear_used = CompleteGear.create(complete_id: @complete.id, user_gear_id: @usergear.id)

  # @creator_gear = @creator.user_gears.find_by(id: params[:user_gear_id])
  # @creator_gear_used = CompleteGear.create(complete_id: @complete.id, user_gear_id: @creator_gear.id)
  if @gear_used.save
    redirect_to "/users/#{@creator.id}/hikes/#{@hike.id}/complete"

  end
end

def destroy
  @hike = Hike.find_by(id: params[:hike_id])
  @user = User.find_by(id: params[:user_id])
  @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  @gear = @complete.complete_gears.find(params[:id])
  @gear.destroy
  redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
end

private
def gear_params
   params.permit( :complete_id, :user_gear_id)
end

end
