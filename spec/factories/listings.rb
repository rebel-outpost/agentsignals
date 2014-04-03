FactoryGirl.define do
  factory :listing do
    title           { Faker::Lorem.sentence(3) }
    price           { Faker::Number.number(6) }
    house_number    { Faker::Address.building_number }
    street_name     { Faker::Address.street_name }
    city_name       { Faker::Address.city }
    zipcode         { Faker::Address.postcode }
  end
end