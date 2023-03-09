class GuestCostsController < ApplicationController

    def new
        @user = User.find(params[:id])
        @complete = Complete.find_by(user_id: @user.id)
        @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)

        @guest_cost = GuestCost.new
    end
    
    def create
        @user = User.find(params[:id])
        @complete = Complete.find_by(user_id: @user.id)
        @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
        @guest_cost = GuestCost.create(guest_cost_params)
        # binding.pry
        if @guest_cost.save
        redirect_to "/users/#{current_user.id}"
        else
        render 'new'
        end
    end
    
    # def show
    #     @guest_cost = GuestCost.find(params[:id])
    # end
    
    private
        def guest_cost_params
        params.permit(:participant_id, :item, :price)
        end

end