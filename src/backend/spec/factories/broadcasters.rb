FactoryBot.define do
  factory :broadcaster do
    id { 1 }
    login { "sample_user_1" }
    display_name { "サンプルユーザー1" }
    profile_image_url { "profile_image_url" }
    language { "Japanese" }
  end
end
