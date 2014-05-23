# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :user
    name              'Event Name'
    due_date          DateTime.now
  end
end
