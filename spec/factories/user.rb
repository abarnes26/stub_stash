FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "theuser#{n}@fake.com" }
    password "password"
    role 0
  end
end
