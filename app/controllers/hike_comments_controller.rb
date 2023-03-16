class HikeCommentsController < ApplicationController

    def new
      @hike = Hike.find(params[:id])
      @user = User.find_by(id: params[:user_id])
      @comment = Comment.new(complete_id: @hike.id)
      
    end

    def show
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @comments = @hike.hike_comments
    end
  
    def create
      @hike = Hike.find(params[:id])
      @user = User.find_by(id: params[:user_id])
      @comment = @hike.hike_comments.create(hike_comment_params)
      if @comment.save
        redirect_to "/users/#{@user.id}/hikes/#{@hike.id}"
      end
    end
  
 

    def destroy
      @hike = Hike.find_by(id: params[:hike_id])
      @user = User.find_by(id: params[:user_id])
      @comment = @hike.hike_comments.find(params[:id])
      @comment.destroy
      redirect_to "/users/#{@user.id}/hikes/#{@hike.id}"
    end
  
    private
    def hike_comment_params
       params.permit(:body,:hike_id, :user_id, :image)
    end
  end