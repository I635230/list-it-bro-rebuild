class ApplicationController < ActionController::API
  private

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
