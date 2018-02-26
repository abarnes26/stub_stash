FactoryBot.define do
  factory :artist do
    sequence(:name) { |n| "Arist#{n}" }
  end
end
