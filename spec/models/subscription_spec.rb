require 'spec_helper'

describe Subscription do
  context "when validating attributes" do

    before :each do
      @user = create(:user)
      @plan = create(:plan)
      @subscription = create(:subscription, plan: @plan, user: @user)
    end

    it "should be valid with default factory attributes" do
      expect(@subscription).to be_valid
    end

    it "should not be valid without user_id" do
      @subscription.user_id = nil
      expect(@subscription).to_not be_valid
    end

    it "should not be valid without plan_id" do
      @subscription.plan_id = nil
      expect(@subscription).to_not be_valid
    end

    it "should not be valid without stripe_customer_token" do
      @subscription.stripe_customer_token = nil
      expect(@subscription).to_not be_valid
    end
  end

  context 'credit card info' do

    before do
      card = { number: '4242424242424242', exp_month: '12', exp_year: '2014'}
      @user = build(:user)
      @plan = build(:plan)

      @subscription = build(:subscription, user: @user, plan: @plan, stripe_card_token: card)
      @subscription.save_with_payment
      @customer    = Stripe::Customer.retrieve @subscription.stripe_customer_token
      @active_card = @customer.cards.first
    end

    it "should have last_four" do
      expect(@subscription.last_four).to eq @active_card.last4
    end

    it "should have card_type"do
      expect(@subscription.card_type).to eq @active_card.type
    end

    it "should have card_expiration"do
      expect(@subscription.card_expiration).to eq "#{ @active_card.exp_month }-#{ @active_card.exp_year }"
    end

  end

  context 'subscription info' do

    before do
      card = { number: '4242424242424242', exp_month: '12', exp_year: '2014'}
      @user = create(:user)
      @plan = create(:plan)

      @subscription = create(:subscription, user: @user, plan: @plan, stripe_card_token: card)
      @subscription.save_with_payment
      @customer    = Stripe::Customer.retrieve @subscription.stripe_customer_token
      @active_card = @customer.cards.first
    end

    it "should have plan" do
      expect(@customer.subscriptions.first.plan).to be
    end

    it 'should have plan name' do
      expect(@customer.subscriptions.first.plan.name).to eq @plan.name
    end

    it "should have plan cost"do
      expect(@customer.subscriptions.first.plan.amount).to eq 599
    end

    it "should have plan interval"do
      expect(@customer.subscriptions.first.plan.interval).to eq "month"
    end

  end
end
