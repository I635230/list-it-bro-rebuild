class ClipsController < ApplicationController
  # 特定のクリップを出力
  def show
    @clip = Clip.find_by(slug: params[:id])
    if @clip
      render status: :ok, json: @clip
    else
      render status: :not_found
    end
  end

  # クリップ視聴数の更新
  def update
    # 入力
    clip_id = params[:id]
    return render status: :bad_request, json: { error: "clip_idが必要です" } if clip_id.blank?

    # 準備
    @clip = Clip.find_by(slug: clip_id)
    return render status: :not_found, json: { error: "clipが見つかりません" } unless @clip

    # データ取得
    view_count = get_view_count(clip_id)

    # 更新
    @clip.update(view_count: view_count)

    # 出力
    render status: :ok, json: @clip
  rescue ActiveRecord::RecordInvalid => e
    # エラー時の出力
    render status: :unprocessable_entity, json: { error: e.record.errors.full_messages.to_sentence }
  end

  private

  # クリップ視聴数を取得する関数
  def get_view_count(clip_id)
    # 準備
    uri = "https://api.twitch.tv/helix/clips?id=#{clip_id}"

    # データ取得
    response = get_request(twitch_api_header("app-access-token"), uri)
    data = response.dig("data", 0)

    # エラーハンドリング
    raise StandardError, "view_countの取得に失敗しました" unless data

    # 出力
    data["view_count"]
  end
end
