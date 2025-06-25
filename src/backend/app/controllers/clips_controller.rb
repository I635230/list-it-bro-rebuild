class ClipsController < ApplicationController
  # 特定のクリップを出力
  def show
    # 入力
    clip_id = params[:id]

    # paramsチェック
    return render_bad_request if clip_id.blank?

    # 検索
    @clip = Clip.find_by(slug: params[:id])

    # 中断処理
    return render_not_found unless @clip

    # 出力
    render status: :ok, json: @clip
  end

  # クリップ視聴数の更新
  def update
    # 入力
    clip_id = params[:id]

    # paramsチェック
    return render_bad_request if clip_id.blank?

    # 検索
    @clip = Clip.find_by(slug: clip_id)

    # 中断処理
    return render_not_found unless @clip

    # データ取得
    view_count = get_view_count(clip_id)

    # 更新
    @clip.update(view_count: view_count)

    # 出力
    render status: :ok, json: @clip
  rescue ActiveRecord::RecordInvalid => e
    # エラー時の出力
    render_unprocessable_entity(e)
  end
end
