module TwitchApiDealer
  # 配信者IDから配信者データを取得する関数
  def get_broadcaster_data(broadcaster_id)
    # 引数チェック
    validate_arguments!(broadcaster_id)

    # 準備
    uri = "https://api.twitch.tv/helix/users?id=#{broadcaster_id}"

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)
    broadcaster_data = response.dig("data", 0)

    # エラーハンドリング
    validate_variable!(broadcaster_data)

    # 出力
    broadcaster_data
  end

  # クリップIDから配信者IDを取得する関数
  def get_broadcaster_id(clip_id)
    # 引数チェック
    validate_arguments!(clip_id)

    # 準備
    uri = "https://api.twitch.tv/helix/clips?id=#{clip_id}"

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)
    broadcaster_id = response.dig("data", 0, "broadcaster_id")

    # エラーハンドリング
    validate_variable!(broadcaster_id)

    # 出力
    broadcaster_id
  end

  # 配信者IDから配信者の最も人気なクリップの言語を取得する関数
  def get_first_clip_language(broadcaster_id)
    # 引数チェック
    validate_arguments!(broadcaster_id)

    # 準備
    uri = "https://api.twitch.tv/helix/clips?broadcaster_id=#{broadcaster_id}&first=1"

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)
    language = response.dig("data", 0, "language")

    # エラーハンドリング
    validate_variable!(language)

    # 出力
    language
  end
end
