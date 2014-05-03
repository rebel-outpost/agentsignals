# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    contact_id 1
    listing_id 1
    agent_id 1
    offer_amount "MyString"
    offer_sent_at ""
    offer_expiration ""
    counter_offer_amount "MyString"
    counter_offer_received_at ""
  end
end
