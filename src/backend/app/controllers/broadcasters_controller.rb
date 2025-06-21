class BroadcastersController < ApplicationController
  # 日本の配信者の一覧を出力(id, nameを指定可)
  def index
    if params[:only_ids]
      render status: :ok, json: Broadcaster.where(language: "ja").map(&:id)
    else
      render status: :ok, json: Broadcaster.where(language: "ja").map(&:display_name)
    end
  end

  # 配信者を登録
  def create
    # 入力
    clip_id = params[:clip_id]
    broadcaster_id = params[:broadcaster_id] || get_broadcaster_id(clip_id)

    # 準備
    uri = "https://api.twitch.tv/helix/users?id=#{broadcaster_id}"

    # 中断処理
    if @broadcaster = Broadcaster.find_by(id: broadcaster_id)
      render status: :ok, json: @broadcaster
      return
    end

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)
    data = response.dig("data", 0)

    # エラーハンドリング
    unless data
      render status: :unprocessable_entity, json: { error: "Broadcasterが見つかりませんでした" }
      return
    end

    # 配信者を作成してDBに保存
    begin
      @broadcaster = build_broadcaster(data)
    rescue ActiveRecord::RecordInvalid => e
      render status: :unprocessable_entity, json: { error: e.record.errors.full_messages.to_sentence }
      return
    end

    # 出力
    render status: :created, json: @broadcaster
  end

  private

  # 配信者IDを取得する関数
  def get_broadcaster_id(clip_id)
    # 準備
    uri = "https://api.twitch.tv/helix/clips?id=#{clip_id}"

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)
    data = response.dig("data", 0)

    # エラーハンドリング
    raise StandardError, "broadcaster_idの取得に失敗しました" unless data

    # 出力
    data["broadcaster_id"]
  end

  # 配信者の最も人気なクリップの言語を取得する関数
  def get_first_clip_language(broadcaster_id)
    # 準備
    uri = "https://api.twitch.tv/helix/clips?broadcaster_id=#{broadcaster_id}&first=1"

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)

    # 出力
    response.dig("data", 0, "language") || "en"
  end

  # 配信者を作成してDBに保存する関数
  def build_broadcaster(data)
    Broadcaster.create!(id: data["id"],
                        login: data["login"],
                        display_name: data["display_name"],
                        language: get_first_clip_language(data["id"]),
                        profile_image_url: data["profile_image_url"])
  end
end
