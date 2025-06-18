FactoryBot.define do
  factory :clip do
    id { 1 }
    slug { "RepleteBitterCormorantUWot-tyks4HB68CU1J7Kc" }
    creator_id { 72207428 }
    creator_name { "ジョイ君" }
    language { "ja" }
    title { "葛葉をボコボコにする時風" }
    clip_created_at { "2023-01-23T12:21:47Z" }
    thumbnail_url { "https://clips-media-assets2.twitch.tv/sFnQmLcpLOBwevAlNSeynA/AT-cm%7CsFnQmLcpLOBwevAlNSeynA-preview-480x272.jpg" }
    duration { 21.3 }
    view_count { 14554 }
    association :broadcaster
    association :game
  end
end
