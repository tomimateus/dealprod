FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password '123456789'
  end
end