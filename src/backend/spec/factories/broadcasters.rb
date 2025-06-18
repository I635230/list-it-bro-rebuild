FactoryBot.define do
  factory :broadcaster do
    sequence(:id) { |n| "#{n}" }
    login { "sample_broadcaster" }
    display_name { "サンプル配信者" }
    profile_image_url { "profile_image_url" }
    language { "ja" }
  end
end
