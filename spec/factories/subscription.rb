FactoryGirl.define do
  factory :subscription do
    user
    plan
    sequence(:stripe_customer_token) { |n| "Token #{ n }" }
  end
end

