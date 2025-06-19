FactoryBot.define do
  factory :playlist do
    sequence(:id) { |n| "#{n}" }
    sequence(:slug) { |n| "slug-#{n}" }
    title { "テストタイトル" }
    public { true }
    association :user
  end
end
