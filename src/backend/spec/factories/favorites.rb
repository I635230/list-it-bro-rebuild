FactoryBot.define do
  factory :favorite do
    association :playlist
    association :user
  end
end
