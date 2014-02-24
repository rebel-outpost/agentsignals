FactoryGirl.define do
  factory :lead do
    sequence(:email) { |n| "lead#{n}@example.com" }
  	first_name             'Ima'
    last_name							 'Lead'
    phone									 '8005551212'
    sequence(:lead_owner) { |n| "lead_owner#{n}@example.com" }
  end
end