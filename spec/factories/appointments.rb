# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    association :user
    name              'Sign contract'
    due_date          '2014-02-19'
    task_type         'appointment'
    assigned_to       :user
    lead_for_task     { Faker::Internet.email }
  end
end
