class AgentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = current_user
    @agents = @user.account.agents
  end

  def new
    @agent = Agent.new
  end

  def create

  end

  def edit
    @agent = Agent.find params[:id]
  end

  def update

  end

  def destroy

  end

  private

  def agent_params
    params.require(:agent).permit!
  end

end
