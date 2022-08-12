class WelcomeController < ApplicationController

  def index
    @hikes = Hike.all
  end

end
