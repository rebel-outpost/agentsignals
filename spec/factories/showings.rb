# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showing do
    association :user
<<<<<<< HEAD
    name              'Call Lead'
    due_date          '2014-02-19'
    task_type         'call'
=======
    name              'Show home'
    due_date          '2014-02-19'
    task_type         'showing'
>>>>>>> bcfb26342d827241c0a82b2e4e924c293e009bf2
    assigned_to       :user
    lead_for_task     { Faker::Internet.email }
  end
end
