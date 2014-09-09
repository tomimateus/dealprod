FactoryGirl.define do
  factory :company do
    user
    name { Forgery::Name.first_name }
  end
end