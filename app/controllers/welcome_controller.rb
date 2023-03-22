class WelcomeController < ApplicationController

  def index
    @hikes = Hike.all
    @user = current_user
  end

end
