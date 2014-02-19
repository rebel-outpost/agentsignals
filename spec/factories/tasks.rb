FactoryGirl.define do
  factory :task do
  	task_name					'Call Lead'
  	due_date					'2014-02-19'
  	assigned_to				'Bill'
  	task_type					'call'
    lead_for_task     'lead@example.com'
  end
end