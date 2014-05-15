FactoryGirl.define do
  factory :offer do
    contact_id                  { Faker::Number.number(2) }
    listing_id                  { Faker::Number.number(6) }
    offer_amount                { Faker::Number.number(6) }
    offer_sent_at               Date.today + 5
    offer_expiration            Date.today + 6
    counter_offer_amount        { Faker::Number.number(6) }
    counter_offer_received_at   Date.today + 7
    seller_name                 { Faker::Name.name }
    price                       { Faker::Number.number(6) }
  end
end
