require "spec_helper"

describe 'Account' do
  context 'Validation' do

    it "is valid with a name and phone" do
      account = build(:account)
      expect(account).to have(0).errors
    end

    it "is invalid without a name" do
      account = build(:account, name: nil)
      expect(account).to have(1).errors_on(:name)
    end

    it "is invalid without a phone" do
      account = build(:account, phone: nil)
      expect(account).to have(1).errors_on(:phone)
    end

    it "is invalid with a duplicate name" do
      create(:account, name: 'Roto Rooter')
      account = build(:account, name: 'Roto Rooter')
      expect(account).to have(1).errors_on(:name)
    end

    it 'is valid with subscription'
    it 'is invalid without a subscription'
    it 'has max users count'
    it 'will not add users past the max users'
    it 'has an account admin'

  end
end