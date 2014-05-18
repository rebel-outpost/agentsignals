class SearchesController < ApplicationController
  def show
    binding.pry
    @listings = Listing.search params[:query]
  end
end
