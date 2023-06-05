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
   
   if @user.save && @user.avatar.attached?
     log_in @user
     redirect_to user_path(@user.id)
   elsif @user.save && !@user.avatar.attached?
     log_in @user
      @user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test.jpg')), filename: 'test.png', content_type: 'image/png')
      redirect_to user_path(@user.id)

   else
     render :new
   end
 end

 def edit
    @user = User.find(params[:id])
 end


 def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
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

 

  private
    def user_params
      params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :avatar)
    end
end
