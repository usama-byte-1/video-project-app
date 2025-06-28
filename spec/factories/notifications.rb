FactoryBot.define do
  factory :notification do
    content { "You have a new project assigned." }
    association :pm
  end
end
