FactoryGirl.define do
  factory :account do
    email      { Faker::Internet.email }
    name       { Faker::Company.name }
    phone      { Faker::PhoneNumber.phone_number }
    website    { Faker::Internet.domain_name }
    address    { Faker::Address.street_address }
    subscription_plan  1
    max_users 1
  end
end