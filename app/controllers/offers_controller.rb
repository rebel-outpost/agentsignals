class OffersController < ApplicationController
  before_filter :authenticate_user!
  
  def index

  end

  def new
    @offer = Offer.new
  end

  def create

  end

  def destroy

  end

  private

  def offer_params
    params.require(:offer).permit!
  end
  
end
