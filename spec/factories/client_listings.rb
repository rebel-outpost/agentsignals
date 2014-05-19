# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client_listing do
    association :client
    association :listing
  end
end
