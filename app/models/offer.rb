class Offer < ActiveRecord::Base

  # integer :contact_id
  # integer :listing_id
  # integer :agent_id
  # string :offer_amount
  # datetime :offer_sent_at
  # datetime :offer_expiration
  # string :counter_offer_amount
  # datetime :counter_offer_received_at

  # index :contact_id
  # index :listing_id
  # index :agent_id

  validates_presence_of :price, :seller_name
end
