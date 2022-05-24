class CommentController < ApplicationController

  def show
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
  end

  def new
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    @comment = Comment.new(complete_id: @complete.id)
  end

  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    @comment = @complete.comments.create(comment_params)
    if @comment.save
      redirect_to "/users/#{@user.id}"
    end
  end

  private
  def comment_params
     params.permit(:body,:complete_id)
  end
end
