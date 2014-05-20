class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def dashboard
    @leads = Lead.all.where(lead_owner: current_user.email).to_a
    # @tasks = Task.all.where(assigned_to: current_user.email).to_a
    @clients = current_user.clients.all
    @tasks = Task.all
    @appointments = Appointment.all
    @showings = Showing.all
    flash.delete(:alert) if flash[:alert] == "You are already signed in."
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(users_params)
    if @user.save
      redirect_to :back, notice: 'User has been successfully updated'
    else
      redirect_to :back, error: "User was unable to be updated"
    end
  end

  def users_params
    params.require(:user).permit! if params[:user]
  end

end
