# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    password  'password'
    sequence :email do |n|
      "admin_user#{n}@example.com"
    end
  end
end
