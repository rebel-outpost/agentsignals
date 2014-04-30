require "spec_helper"

describe 'Listing' do
  context 'Validation' do

    it "is valid with a title" do
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:title)
    end

    it "is invalid with out a title" do
      listing = build(:listing, title: nil)
      expect(listing).to have(1).errors_on(:title)
    end

    it 'is valid with a price' do
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:price)
    end

    it 'is invalid without a price' do
      listing = build(:listing, price: nil)
      expect(listing).to have(1).errors_on(:price)
    end

    it 'it valid with a house number' do
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:house_number)
    end

    it 'it invalid without a house number' do
      listing = build(:listing, house_number: nil)
      expect(listing).to have(1).errors_on(:house_number)
    end

    it 'it valid with a street name' do
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:street_name)
    end

    it 'it invalid without a street name' do
      listing = build(:listing, street_name: nil)
      expect(listing).to have(1).errors_on(:street_name)
    end

    it 'it valid with a city name' do
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:city_name)
    end

    it 'it invalid without a city name' do
      listing = build(:listing, city_name: nil)
      expect(listing).to have(1).errors_on(:city_name)
    end

    it 'it valid with a zip code' do
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:zipcode)
    end

    it 'it invalid without a zip code' do
      listing = build(:listing, zipcode: nil)
      expect(listing).to have(1).errors_on(:zipcode)
    end

    it 'is valid with a listing number' do
      #new-test
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:listing_number)
    end

    it 'is invalid without a listing number' do
      #new-test
      listing = build(:listing, listing_number: nil)
      expect(listing).to have(1).errors_on(:listing_number)
    end

    it 'is valid with a listing owner' do
      #new-test
      listing = build(:listing)
      expect(listing).to have(0).errors_on(:listing_owner)
    end

    it 'is valid with a listing owner' do
      #new-test
      listing = build(:listing, listing_owner: nil)
      expect(listing).to have(1).errors_on(:listing_owner)
    end

    it 'has a contact' do
      #new-test
      listing = build(:listing)
      expect(listing).to have(1).contact
    end

    it 'requires contact' do
      #new-test
      listing = build(:listing, contact: nil)
      expect(listing).to have(1).errors_on(:contact)
    end


  end
end