# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showing do
    association :user
    due_date DateTime.now
    association :client
  end
end
