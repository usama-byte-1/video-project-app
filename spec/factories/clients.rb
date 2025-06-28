FactoryBot.define do
  factory :client do
    name { "Client A" }
    association :pm
  end
end
