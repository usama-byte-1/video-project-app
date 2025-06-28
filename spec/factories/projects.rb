FactoryBot.define do
  factory :project do
    name { "Demo Project" }
    raw_footage_link { "https://example.com/video" }
    status { "In Progress" }
    association :client
    pm { client.pm }
  end
end
