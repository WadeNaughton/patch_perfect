class UserGearsController < ApplicationController

def new
  @user = User.find(params[:id])
  @gear = UserGear.new(user_id: params[@user.id])
end

def create
  @user = User.find(params[:id])
  @gear = @user.user_gears.new(user_gear_params)
  if @gear.save
    redirect_to "/users/#{@user.id}"
  end
end

def destroy
  @user = User.find_by(id: params[:user_id])
  @gear = UserGear.find(params[:id])
  @gear.destroy
  redirect_to "/users/#{@user.id}"
end

private
def user_gear_params
   params.permit(:name, :pounds, :ounces, :user_id)
end

end
