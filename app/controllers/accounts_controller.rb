class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    if @account.save
      @account.users << current_user
      flash[:notice] = 'Account successfully created'
      redirect_to :dashboard
    else
      flash[:error] = 'Unable to create account'
      redirect_to :back
    end
  end

  def update
    @account = Account.find params[:id]
    if @account.update_attributes(account_params)
      flash[:notice] = 'Successfully updated your account'
      redirect_to :back
    else
      flash[:error] = 'Unable to update your account'
      redirect_to :back
    end
  end

  def add_user
    @account = Account.find params[:id]
    if @account.users.create(user_params)
      flash[:notice] = 'User successfully added'
      redirect_to :back
    else
      flash[:error] = 'Unable to add new user'
      redirect_to :back
    end
  end

  def settings
    @user = current_user
    @account = Account.find params[:id]
  end

  def account_params
    params.require(:account).permit! if params[:account]
  end

  def user_params
    params.require(:user).permit! if params[:user]
  end
end
