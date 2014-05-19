require "spec_helper"

describe 'User' do

  describe :clients do
    before do
      @user = FactoryGirl.create :user 
      @client = FactoryGirl.create :client, assignee_id: @user.id
    end

    it {@user.clients =~ [@client]}
  end

  describe :leads do
    before do
      @user = FactoryGirl.create :user 
      @client = FactoryGirl.create :lead, assignee_id: @user.id
    end

    it {@user.leads =~ [@client]}
  end

  describe :full_name do
    before {@user = FactoryGirl.create :user, first_name: "James", last_name: "Bond"}

    it {@user.full_name.should eq "James Bond"}

  end

  context 'Validation' do

    it "is valid with a firstname, lastname and email" do
      user = build(:user)
      expect(user).to have(0).errors
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