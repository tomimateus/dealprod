FactoryGirl.define do
  factory :offer do
    name { Forgery::LoremIpsum.word(:random => true) }
    start_date 12/12/2013
    end_date 13/12/2013
  end
end