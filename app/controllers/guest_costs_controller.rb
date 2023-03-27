class GuestCostsController < ApplicationController

    def show 
        @user = User.find(params[:id])
        @complete = Complete.find_by(user_id: @user.id)
        @participant = Participant.find_by(id: params[:participant_id], complete_id: @complete.id)
        @guest_costs = @participant.guest_costs
        @total = @guest_costs.sum(:price)
    end

    def new
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
        @guest_cost = GuestCost.new
    end
    
    def create
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
        @guest_cost = GuestCost.new(guest_cost_params)


        if @guest_cost.save
            redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
        else
          render 'new'
        end
    end
    
 
    
    private
        def guest_cost_params
        params.permit(:participant_id, :item, :price)
        end

end