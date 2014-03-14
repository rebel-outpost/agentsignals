FactoryGirl.define do

  factory :user do
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    phone                 { Faker::PhoneNumber.phone_number }
    email                 { Faker::Internet.email }
    password              'password'
    password_confirmation 'password'

    factory :org_admin do
      organization_role 'Admin'
    end

  end

end
