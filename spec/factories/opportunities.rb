FactoryGirl.define do
  factory :opportunity do
  	opportunity_name  { Faker::Company.bs }
    contact_name      { Faker::Company.name }
    owner             { Faker::Internet.email }
  end
end