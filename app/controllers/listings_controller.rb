class ListingsController < ApplicationController

  def index
    @listings = current_user.account.listings
  end

  def new
    @listing = current_user.account.listings.new
    @account_contacts = current_user.account.contacts.map(&:full_name)
    @account_users    = current_user.account.users.map(&:full_name)
  end

  def create
    @listing = current_user.account.listings.create listings_params
    if @listing.save
      redirect_to listings_path, flash: { notice: 'New Listing Created'}
    else
      render :new
    end
  end

  def show
    @listing = Listing.find params[:id]
  end

  def update
    @listing = Listing.find params[:id]
    @listing.update_attributes listings_params
    if @listing.save
      redirect_to :back, flash: { notice: 'Listing successfully updated'}
    else
      redirect_to :back, flash: { notice: 'Unable to update listing'}
    end
  end

  def destroy
    @listing = Listing.find params[:id]
    if @listing.destroy
      redirect_to :back, flash: { notice: 'Listing successfully deleted'}
    else
      redirect_to :back, flash: { notice: 'Unable to delete listing'}
    end
  end

  def listings_params
    params.require(:listing).permit! if params[:listing]
  end
end
