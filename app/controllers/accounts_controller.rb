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

  def account_params
    params.require(:account).permit! if params[:account]
  end
end
