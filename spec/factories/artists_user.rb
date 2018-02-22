FactoryBot.define do
  factory :artist_user do
    association :user, factory: :user
    association :artist, factory: :artist
  end
end
