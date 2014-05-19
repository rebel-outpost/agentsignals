class ClientsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @clients = current_user.clients.all
  end

  def show
    @client = Client.find params[:id]
  end
end
