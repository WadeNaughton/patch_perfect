class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites
    @completes = @user.completes
  end

  def new
    @user = User.new(user_params)
  end

  def create
   @user = User.new(user_params)
   if @user.save
     log_in @user
     redirect_to user_path(@user.id)
   else
     render :new
   end
 end

  def login_form


  end

  def login
      user = User.find_by(email: params[:email])
    if user.nil?
      render :login_form

    elsif user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to user_path(user)
    else
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
