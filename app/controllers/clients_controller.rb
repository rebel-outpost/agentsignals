class ClientsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @client = current_user.clients.new
  end

  def index
    @clients = current_user.clients.all
  end

  def show
    @client = Client.find params[:id]
    @tasks = @client.tasks
    @appointments = @client.appointments
    @showings = @client.showings

    @offers = @client.offers

    @selling = @client.client_listings.selling
    @renting = @client.client_listings.renting
    @looking_at_listings = @client.client_listings.looking
  end

  def create
    @client = current_user.clients.new(clients_params)
    if @client.save
      redirect_to clients_path, flash: { notice: 'New Client Created'}
    else
      render :new
    end
  end

  def edit
    @client = current_user.clients.find params[:id]
  end

  def update
    @client = current_user.clients.find params[:id]

    if @client.update_attributes(clients_params)
      redirect_to client_path @client, flash[:notice] = 'Client Updated'
    else
      render :edit
    end
  end

  def destroy
    @client = current_user.clients.find params[:id]
    if @client == @current_user
      flash[:notice] = 'Cannot delete yourself'
      redirect_to :back
    elsif @client.destroy
      flash[:notice] = 'Client Deleted'
      redirect_to :back
    else
      flash[:error] = 'Client could not be deleted'
      redirect_to :back
    end
  end

  def clients_params
    params.require(:client).permit! if params[:client]
  end
end
