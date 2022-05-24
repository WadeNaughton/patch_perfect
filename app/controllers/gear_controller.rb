class GearController < ApplicationController

def new
  @hike = Hike.find(params[:id])
  @user = User.find_by(id: params[:user_id])
  @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  @gear = Gear.new(complete_id: @complete.id)
end

def create
  @hike = Hike.find(params[:id])
  @user = User.find_by(id: params[:user_id])
  @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  @gear = @complete.gears.create(gear_params)

  if @gear.save
    redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
  end
end

private
def gear_params
   params.permit(:name, :weight, :complete_id)
end

end
