class CompletesController < ApplicationController

  def show
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    @comments = @complete.comments
    @gear_used = @complete.complete_gears.all
    @total_weight = @complete.total_weight
    @participants = @complete.participants
    @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
    @host_cost = @complete.costs.sum(:price)
    @total_cost = @complete.total_cost + @complete.total_guest_cost
    @split_cost = @total_cost / (@participants.count + 1)

  end
  

  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    complete = Complete.find_or_create_by(hike_id: @hike.id, user_id: @user.id)
    if @hike.save
      # render "hikes/show"
      redirect_to "/users/#{@user.id}"
    end
  end

end
