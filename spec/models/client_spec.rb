require 'spec_helper'

describe Client do
  
  describe :listings do 
    before do 
      @client = FactoryGirl.create :client
      @listing = FactoryGirl.create :listing
      @client_listing = FactoryGirl.create :client_listing, user_id: @client.id, listing_id: @listing.id
    end

    it "it should return an array of listing" do
      @client.listings.should =~ [@listing]
    end

    it "should destroy the contact listing when client is destroyed" do
      @client.destroy 
      ClientListing.count.should eq 0
    end
  end
end
