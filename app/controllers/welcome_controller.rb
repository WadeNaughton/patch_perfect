class WelcomeController < ApplicationController

  def index

  end

  def new
    @user = User.new(user_params)
  end

  def create
   @user = User.new(user_params)
   if @user.save
     redirect_to user_path(@user.id)
   else
     render :new
   end
 end

 private
 def user_params
   params.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
 end

end
