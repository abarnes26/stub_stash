FactoryBot.define do
  factory :band_user do
    association :user, factory: :user
    association :band, factory: :band
  end
end
