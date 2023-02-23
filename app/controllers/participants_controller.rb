class ParticipantsController < ApplicationController



    def new
        @users = User.all
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participants =  User.all_except(@user)
       
        
    end

    def create
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participant = Participant.create(complete_id: @complete.id, user_id: params[:participant_id])
        if @participant.save
            redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
        end
    end

    def destroy
        @hike = Hike.find(params[:hike_id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        participant = Participant.find(params[:id])
        participant.destroy
        redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"

    end

    private
    def participant_params
      params.permit(:complete_id, :user_id)
    end

end