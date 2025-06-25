class ApplicationController < ActionController::API
  # すべてのコントローラに以下のモジュールをincludeする
  include HttpDealer
  include ErrorDealer
  include TwitchApiDealer

  private

  # bad_requestをrenderする関数
  def render_bad_request(message = "不正なリクエストです")
    render status: :bad_request, json: { error: message }
  end

  # not_foundをrenderする関数
  def render_not_found(message = "リソースが見つかりません")
    render status: :not_found, json: { error: message }
  end

  # unprocessable_entityをrenderする関数
  def render_unprocessable_entity(e)
    render status: :unprocessable_entity, json: { error: e.record.errors.full_messages.to_sentence }
  end

  # Twitch APIへのリクエストのヘッダー
  def twitch_api_header(type, current_user = nil)
    return nil if type.blank?

    if type == "app-access-token"
      return nil if ENV["APP_ACCESS_TOKEN"].blank? || ENV["CLIENT_ID"].blank?
      {
        "Authorization" => ENV["APP_ACCESS_TOKEN"],
        "Client-id" => ENV["CLIENT_ID"]
      }
    elsif type == "user-access-token"
      return nil if current_user.nil? || current_user.user_access_token.blank? || ENV["CLIENT_ID"].blank?
      {
        "Authorization" => current_user.user_access_token,
        "Client-id" => ENV["CLIENT_ID"]
      }
    elsif type == "www-form"
      {
        "Content-Type" => "application/x-www-form-urlencoded"
      }
    end
  end
end
