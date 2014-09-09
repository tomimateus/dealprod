FactoryGirl.define do
  factory :client do
    user
    first_name { Forgery::Name.first_name }
    last_name { Forgery::Name.last_name }
  end
end