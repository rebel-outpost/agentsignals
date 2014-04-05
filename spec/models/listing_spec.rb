require "spec_helper"

describe 'Listing' do
  context 'Validation' do

    it "is valid with a title" do
      listing = build(:listing)
      expect(listing).to have(0).errors
    end

    it "is invalid with out a title" do
      listing = build(:listing, title: nil)
      expect(listing).to have(1).errors_on(:title)
    end

    it 'is valid with a price' do
      listing = build(:listing)
      expect(listing).to have(0).errors
    end

    it 'is invalid with out a price' do
      listing = build(:listing, price: nil)
      expect(listing).to have(1).errors_on(:price)
    end

    it 'it valid with a house number' do
      listing = build(:listing)
      expect(listing).to have(0).errors
    end

    it 'it valid with a street name' do
      listing = build(:listing)
      expect(listing).to have(0).errors
    end

    it 'it invalid with out a street name' do
      listing = build(:listing, street_name: nil)
      expect(listing).to have(1).errors_on(:street_name)
    end
    it 'it valid with a city name' do
      listing = build(:listing)
      expect(listing).to have(0).errors
    end

    it 'it invalid with out a city name' do
      listing = build(:listing, city_name: nil)
      expect(listing).to have(1).errors_on(:city_name)
    end

    it 'it valid with a zip code' do
      listing = build(:listing)
      expect(listing).to have(0).errors
    end

    it 'is valid with a listing number'
    it 'is valid with a listing owner'
    it 'has a contact'

  end
end