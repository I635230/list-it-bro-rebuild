FactoryBot.define do
  factory :clip do
    sequence(:id) { |n| "#{n}" }
    sequence(:slug) { |n| "slug-#{n}" }
    creator_id { 1 }
    creator_name { "サンプルユーザー" }
    language { "ja" }
    title { "クリップタイトル" }
    clip_created_at { "2025-01-01T00:00:00Z" }
    thumbnail_url { "thumbnail-url" }
    duration { 10.1 }
    view_count { 10000 }
    association :broadcaster
    association :game
  end
end
