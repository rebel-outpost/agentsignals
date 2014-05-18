class ListingsController < ApplicationController

  def index
    @listings = current_user.account.listings
    @hash = Gmaps4rails.build_markers(@listings.viewable_on_map) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.infowindow listing.description
      marker.json({ title: listing.title })
      marker.picture({
        "url" => "mapicons/house.png",
        "width" => 32,
        "height" => 32
        })
    end
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
    @hash = Gmaps4rails.build_markers(@listing) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.infowindow listing.title
      marker.json({ title: listing.description })
      marker.picture({
        "url" => "/mapicons/house.png",
        "width" => 32,
        "height" => 32
        })
    end
  end

  def edit
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
