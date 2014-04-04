FactoryGirl.define do
  factory :lead do
    association :user
    association :account

    email            { Faker::Internet.email }
  	first_name       { Faker::Name.first_name }
    last_name		     { Faker::Name.last_name }
    phone				     { Faker::PhoneNumber.phone_number }
    lead_owner       :user
  end
end