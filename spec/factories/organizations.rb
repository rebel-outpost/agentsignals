FactoryGirl.define do

  factory :organization do
    name        { Faker::Company.name }
    phone       { Faker::PhoneNumber.phone_number }
    address     { Faker::Address.street_address }
    city        { Faker::Address.city }
    state       { Faker::Address.state }
    zip         { Faker::Address.zip }
    max_users   5
  end
end
