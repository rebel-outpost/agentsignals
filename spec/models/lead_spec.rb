require "spec_helper"

describe 'Lead' do
  context 'Validation' do

    it "is valid with a firstname, lastname and email" do
      lead = build(:lead)
      expect(lead).to have(0).errors
    end

    it "is invalid without a firstname" do
      lead = build(:lead, first_name: nil)
      expect(lead).to have(1).errors_on(:first_name)
    end

    it "is invalid without a lastname" do
      lead = build(:lead, last_name: nil)
      expect(lead).to have(1).errors_on(:last_name)
    end

    it "is invalid without an email address" do
      lead = build(:lead, email: nil)
      expect(lead).to have(2).errors_on(:email)
    end

    it "is invalid with a duplicate email address" do
      create(:lead, email: 'test@example.com')
      lead = build(:lead, email: 'test@example.com')
      expect(lead).to have(1).errors_on(:email)
    end

    it "returns a lead's full name as a string" do
      lead = create(:lead, first_name: 'Test', last_name: 'User')
      expect(lead.full_name).to eq 'Test User'
    end

    it 'is taggable' do
      lead = create(:lead)
      lead.tag_list.add("buyer", "renter")
      expect(lead.tags).to be
      expect(lead.tag_list.count).to eq 2
    end

  end
end