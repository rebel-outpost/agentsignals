class Subscription < ActiveRecord::Base
  attr_accessor :stripe_card_token

  belongs_to :plan
  belongs_to :user

  validates :user_id,                presence: true, uniqueness: true
  validates :plan_id,                presence: true
  validates :stripe_customer_token,  presence: true


  def save_with_payment
    customer = Stripe::Customer.create email: user.email, plan: plan.id, card: stripe_card_token
    self.stripe_customer_token = customer.id

    set_card_info customer.cards.first
    save
  rescue Stripe::InvalidRequestError => e
    logger.error "[STRIPE] #{ e }"
    errors[:base] << "Unable to process your credit card!"
    false
  end

private

  def set_card_info new_card
    self.last_four       = new_card.last4
    self.card_type       = new_card.type
    self.card_expiration = "#{ new_card.exp_month }-#{ new_card.exp_year }"
  end

end
