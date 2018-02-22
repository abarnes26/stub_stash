FactoryBot.define do
  factory :show do
    association :user, factory: :user
    association :artist, factory: :artist
    association :venue, factory: :venue
    date "21/3/2017"
  end
end
