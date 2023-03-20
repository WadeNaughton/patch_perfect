class CompletesController < ApplicationController

  def show
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    @comments = @complete.comments
    @gear_used = @complete.complete_gears.all
    @grouped_gear_used = @complete.grouped_gear
    @total_weight = @complete.total_weight
    @participants = @complete.participants
    # @participant = Participant.find_by(user_id: current_user.id, complete_id: @complete.id)
    @host_cost = @complete.costs.sum(:price)
    @total_cost = @complete.total_cost + @complete.total_guest_cost
    @split_cost = @total_cost / (@participants.count + 1)
  end

  

  def create
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    complete = Complete.find_or_create_by(hike_id: @hike.id, user_id: @user.id)
    if @hike.save
      redirect_to "/users/#{@user.id}"


    end
  end

  def edit
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    
  end

  def update
    @hike = Hike.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    @complete = Complete.find_by(hike_id: @hike.id, user_id: @user.id)
    if @complete.update(complete_params)
      redirect_to "/users/#{@user.id}/hikes/#{@hike.id}/complete"
    else
      render :edit
    end
  end



  private

  def complete_params
    params.permit(:hike_id, :user_id, :title)
  end

end
