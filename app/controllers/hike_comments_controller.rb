class HikeCommentsController < ApplicationController

    def new
      @hike = Hike.find(params[:id])
      @user = User.find_by(id: params[:user_id])
      @comment = HikeComment.new(hikes_id: @hike.id)
      binding.pry
    end
  
    def create
      @hike = Hike.find(params[:id])
      @user = User.find_by(id: params[:user_id])
      @comment = @hike.hike_comments.create(hike_comment_params)
      if @comment.save
        redirect_to "/users/#{@user.id}/hikes/#{@hike.id}"
      end
    end
  
    # def destroy
    #   @hike = Hike.find_by(id: params[:hike_id])
    #   @user = User.find_by(id: params[:user_id])
    #   @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    #   @comments = @complete.comments.find(params[:id])
    #   @comments.destroy
    #   redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
    # end
  
    private
    def hike_comment_params
       params.permit(:body,:hikes_id, :image)
    end
  end
  