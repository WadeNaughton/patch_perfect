class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites
    @completes = @user.completes
    @gear = @user.user_gears.all
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

 def edit
    @user = User.find(params[:id])
 end

 def change_password
    @user = User.find(params[:id])
 end

 def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
    binding.pry
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

  private
    def user_params
      params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :avatar)
      # params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :avatar)
    end
end
