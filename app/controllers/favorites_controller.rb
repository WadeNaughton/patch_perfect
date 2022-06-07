class FavoritesController < ApplicationController

  def show
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    favorite = Favorite.find_by(hike_id: @hike.id, user_id: @user.id)

  end

  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    favorite = Favorite.find_or_create_by(hike_id: @hike.id, user_id: @user.id)
  end

end
