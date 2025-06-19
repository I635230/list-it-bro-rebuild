FactoryBot.define do
  factory :playlist do
    sequence(:slug) { |n| "slug-#{n}" }
    title { "テストタイトル" }
    public { true }
    association :user
  end
end
