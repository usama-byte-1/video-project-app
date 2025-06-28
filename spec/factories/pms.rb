FactoryBot.define do
  factory :pm do
    name { "Project Manager" }
    email { Faker::Internet.email }
  end
end
