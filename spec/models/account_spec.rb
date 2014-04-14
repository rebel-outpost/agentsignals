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

    it 'is valid with subscription' do
      account = build(:account)
      expect(account).to have(0).errors_on(:subscription_plan)
    end

    it 'is invalid without a subscription' do
      account = build(:account, subscription_plan: nil)
      expect(account).to have(1).errors_on(:subscription_plan)
    end

    it 'has max users count' do
      account = build(:account)
      expect(account.max_users).to eq 1
    end

    it 'is invalid without max users count' do
      account = build(:account, max_users: nil)
      expect(account).to have(1).errors_on(:max_users)
    end

    it 'has an account admin'

  end
end