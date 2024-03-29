FactoryGirl.define do
  factory :listing do
    listing_number  { Faker::Number.number(2) }
    title           { Faker::Lorem.sentence(1) }
    price           { Faker::Number.number(6) }
    house_number    { Faker::Address.building_number }
    street_name     { Faker::Address.street_name }
    city_name       { Faker::Address.city }
    state           { Faker::Address.state }
    zipcode         { Faker::Address.postcode }
    listing_owner   { Faker::Name.name }
  end
end