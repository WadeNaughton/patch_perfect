class FavoritesController < ApplicationController


  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    favorite = Favorite.find_or_create_by(hike_id: @hike.id, user_id: @user.id)
      if favorite.save
        redirect_to "/users/#{@user.id}"
      end
  end

  def destroy
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    favorite = Favorite.find_by(hike_id: @hike.id, user_id: @user.id)
      if favorite.destroy
        redirect_to "/users/#{@user.id}"
      end
    end

end
