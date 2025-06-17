FactoryBot.define do
  factory :user do
    trait :user1 do
      id { 1 }
      login { "sample_user_1" }
      display_name { "サンプルユーザー1" }
      profile_image_url { "profile_image_url_1" }
      refresh_token { "refresh_token_1" }
    end

    trait :user2 do
      id { 2 }
      login { "sample_user_2" }
      display_name { "サンプルユーザー2" }
      profile_image_url { "profile_image_url_2" }
      refresh_token { "refresh_token_2" }
    end  
  end
end
