# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showing do
    association :user
    name              'Show home'
    due_date          '2014-02-19'
    task_type         'showing'
    assigned_to       :user
    lead_for_task     { Faker::Internet.email }
  end
end
