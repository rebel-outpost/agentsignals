require "spec_helper"

describe 'User' do
  context 'Validation' do

    it "is valid with a firstname, lastname and email" do
      user = build(:user)
      expect(user).to have(0).errors
    end

    it "is invalid without a firstname" do
      user = build(:user, first_name: nil)
      expect(user).to have(1).errors_on(:first_name)
    end

    it "is invalid without a lastname" do
      user = build(:user, last_name: nil)
      expect(user).to have(1).errors_on(:last_name)
    end

    it "is invalid without an email address" do
      user = build(:user, email: nil)
      expect(user).to have(1).errors_on(:email)
    end

    it "is invalid with a duplicate email address" do
      create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')
      expect(user).to have(1).errors_on(:email)
    end

    it "returns a contact's full name as a string" do
      user = create(:user, first_name: 'Test', last_name: 'User')
      expect(user.full_name).to eq 'Test User'
    end

  end
end