class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def dashboard
    @user = current_user
    @leads = @user.leads

    @tasks = @user.tasks
    @appointments = @user.appointments
    @showings = @user.showings

    # Todo - This is a hack
    flash.delete(:alert) if flash[:alert] == "You are already signed in."
  end

  def settings
    @user = User.find params[:id]
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
