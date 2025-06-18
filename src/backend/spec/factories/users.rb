FactoryBot.define do
  factory :user do
    sequence(:id) { |n| "#{n}" }
    login { "sample_user" }
    display_name { "サンプルユーザー" }
    profile_image_url { "profile_image_url" }
    refresh_token { "refresh_token" }
  end
end
