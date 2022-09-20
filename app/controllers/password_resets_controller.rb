class PasswordResetsController < ApplicationController
  def new
  end


  # def create
  #   user = User.find_by(email: params[:email]) && User.find_by(username: params[:username])
  #   if user.present?
  #     test = ApplicationMailer.with(user: user).forgot_password(user)
  #     test.deliver_now
  #     flash[:notice] = 'E-mail sent with password reset instructions.'
  #     redirect_to "/"
  #   else
  #     flash[:notice] = 'invalid email or username'
  #     render :new
  #   end
  # end

    def create
    user = User.find_by(email: params[:email]) && User.find_by(username: params[:username])
    if user.present?
      user.send_password_reset if user
      flash[:notice] = 'E-mail sent with password reset instructions.'
      redirect_to "/"
    else
      flash[:notice] = 'invalid email or username'
      render :new
    end
  end




  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    binding.pry
    if @user.password_reset_sent_at < 2.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_password_reset_path
    elsif @user.update(user_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to "/"
    else
      render :edit
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      
      params.require(:user).permit(:password, :username)
    end
end
