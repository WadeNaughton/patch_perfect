class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites
    @completes = @user.completes
  end

  def login
      user = User.find_by(email: params[:email])
    if user.nil?
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form

    elsif user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:success] = "Welcome, #{user.first_name} #{user.last_name}!"
       redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  def discover

  @user = User.find(params[:id])
  @hikes = Hike.all

  end

  private
    def user_params
      params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
