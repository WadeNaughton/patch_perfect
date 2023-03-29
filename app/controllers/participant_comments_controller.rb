class ParticipantCommentsController < ApplicationController

    def new 
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
        @participant_comment = ParticipantComment.new
       

    end

    def create
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
        @participant_comment = @participant.participant_comments.new(participant_comment_params)
        if @participant_comment.save
            redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
        end
    end



    private 

    def participant_comment_params
        params.permit(:participant_id, :body, :image)
    end

end