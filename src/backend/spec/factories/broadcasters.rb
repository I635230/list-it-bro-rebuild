FactoryBot.define do
  factory :broadcaster do
    id { 1 }
    login { "sample_broadcaster" }
    display_name { "サンプル配信者" }
    profile_image_url { "profile_image_url" }
    language { "Japanese" }
  end
end
