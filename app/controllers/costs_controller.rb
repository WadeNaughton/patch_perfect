class CostsController < ApplicationController



    def new
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @cost = Cost.new(complete_id: @complete.id)
        @participants = @complete.participants.all
    end

    def show
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @costs = @complete.costs 
        @total = @costs.sum(:price)
        @participants = @complete.participants.all
    end
    
    def create
        @hike = Hike.find(params[:id])
        @user = User.find_by(id: params[:user_id])
        @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
        @participants = @complete.participants.all
        
        @cost = @complete.costs.new(cost_params)
        if @cost.save
            redirect_to "/users/#{current_user.id}/hikes/#{@hike.id}/complete"
        end
        
    end
        private

        def cost_params
            params.permit(:item, :price, :complete_id, :user_id)
        end


end