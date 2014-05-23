# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :user
    name              {Faker::Lorem.word}
    due_date          DateTime.now
  end
end
