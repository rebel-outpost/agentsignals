FactoryGirl.define do
  factory :task do
  	task_name					'Call Lead'
  	due_date					'2014-02-19'
  	task_type					'call'
    assigned_to       'sillyuser@example.com'
    lead_for_task     'lead@example.com'
  end
end