require "spec_helper"

describe 'Offer' do
  context 'Validation' do

    it 'is valid with a seller' do
      offer = build(:offer)
      expect(offer).to have(0).errors_on(:seller_name)
    end

    it 'is invalid without a seller' do
      offer = build(:offer, seller_name: nil)
      expect(offer).to have(1).errors_on(:seller_name)
    end

    it 'it is valid with asking price' do
      offer = build(:offer)
      expect(offer).to have(0).errors_on(:price)
    end

    it 'is invalid without asking price' do
      offer = build(:offer, price: nil)
      expect(offer).to have(1).errors_on(:price)
    end

  end
end