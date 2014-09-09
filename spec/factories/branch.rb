FactoryGirl.define do
  factory :branch do
    company
    company_id 2
    name { Forgery::LoremIpsum.word }
  end
end