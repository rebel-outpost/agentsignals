require "spec_helper"

describe 'User' do
  let(:user) {FactoryGirl.create :user}

  describe :lazy_load_events do
    let(:starts) {DateTime.now.beginning_of_month}
    let(:ends) {DateTime.now.end_of_month}

    before do
      @event_with_start_date_before_params = FactoryGirl.create :event, due_date: DateTime.now - 1.month, user: user
      @event_with_start_date_after_params = FactoryGirl.create :event, due_date: DateTime.now - 1.month, user: user
      @event_with_end_date_inside_params = FactoryGirl.create :event, due_date: DateTime.now - 1.month, ends: DateTime.now, user: user
      @event_with_start_date_inside_params = FactoryGirl.create :event, due_date: DateTime.now, user: user
      @event_with_start_and_end_inside_params = FactoryGirl.create :event, due_date: DateTime.now, ends: DateTime.now + 10.minutes, user: user
    end

    it {user.lazy_load_events(starts, ends).should =~ [@event_with_end_date_inside_params, @event_with_start_date_inside_params, @event_with_start_and_end_inside_params]}
    it {user.lazy_load_events(starts, ends).should_not =~ [@event_with_start_date_before_params, @event_with_start_date_after_params]}
  end

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