FactoryGirl.define do
  factory :listing do
    listing_number  { Faker::Number.number(2) }
    title           { Faker::Lorem.sentence(3) }
    price           { Faker::Number.number(6) }
    house_number    { Faker::Address.building_number }
    street_name     { Faker::Address.street_name }
    city_name       { Faker::Address.city }
    zipcode         { Faker::Address.postcode }
    listing_owner   { Faker::Name.name }
  end
end