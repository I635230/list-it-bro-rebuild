FactoryBot.define do
  factory :game do
    sequence(:id) { |n| "#{n}" }
    name { "サンプルゲーム" }
    box_art_url { "box_art_url" }
  end
end
