class WelcomeController < ApplicationController

  def index

  end

  def register

  end

  def create
   user = User.create(user_params)
   if user.save
     redirect_to user_path(user.id)
   else
     flash[:alert] = "Error: Name can't be blank, Email can't be blank and must be valid, Password and Password Confirmation must match."
     redirect_to "/register"
   end
 end

 private
   def user_params
     params.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
   end

end
