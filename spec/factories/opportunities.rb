FactoryGirl.define do
  factory :opportunity do
  	opportunity_name  { Faker::Company.bs }
    account_name      { Faker::Company.name }
    owner             { Faker::Internet.email }
  end
end