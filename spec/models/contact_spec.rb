require "spec_helper"

describe 'Contact' do
  context 'Validation' do

    it "is valid with a firstname, lastname and email" do
      contact = build(:contact)
      expect(contact).to have(0).errors
    end

    it "is invalid without a firstname" do
      contact = build(:contact, first_name: nil)
      expect(contact).to have(1).errors_on(:first_name)
    end

    it "is invalid without a lastname" do
      contact = build(:contact, last_name: nil)
      expect(contact).to have(1).errors_on(:last_name)
    end

    it "is invalid without an email address" do
      contact = build(:contact, email: nil)
      expect(contact).to have(2).errors_on(:email)
    end

    it "is invalid with a duplicate email address" do
      create(:contact, email: 'test@example.com')
      contact = build(:contact, email: 'test@example.com')
      expect(contact).to have(1).errors_on(:email)
    end

    it "returns a contact's full name as a string" do
      contact = create(:contact, first_name: 'Test', last_name: 'User')
      expect(contact.full_name).to eq 'Test User'
    end

  end
end