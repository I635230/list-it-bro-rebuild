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

    # 中断処理
    if @broadcaster = Broadcaster.find_by(id: broadcaster_id)
      render status: :ok, json: @broadcaster
      return
    end

    # データ取得
    broadcaster_data = get_broadcaster_data(broadcaster_id)

    # 配信者を作成してDBに保存
    @broadcaster = build_broadcaster(broadcaster_data)

    # 出力
    render status: :created, json: @broadcaster
  rescue ActiveRecord::RecordInvalid => e
    # エラー時の出力
    render status: :unprocessable_entity, json: { error: e.record.errors.full_messages.to_sentence }
  end

  private

  # 配信者を作成してDBに保存する関数
  def build_broadcaster(data)
    Broadcaster.create!(id: data["id"],
                        login: data["login"],
                        display_name: data["display_name"],
                        language: get_first_clip_language(data["id"]),
                        profile_image_url: data["profile_image_url"])    
  end
end
