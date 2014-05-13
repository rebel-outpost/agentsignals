# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :user
    name              'Call Lead'
    due_date          '2014-02-19'
    task_type         'call'
    assigned_to       :user
    lead_for_task     { Faker::Internet.email }
  end
end
