FactoryBot.define do
  factory :playlist_clip do
    order { 1 }
    association :playlist
    association :clip
  end
end
