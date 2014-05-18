class SearchesController < ApplicationController
  def show
    @listings = Listing.search params[:query]
  end
end
