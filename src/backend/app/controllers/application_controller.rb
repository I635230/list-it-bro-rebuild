class ApplicationController < ActionController::API
  def twitch_api_header(type, current_user = nil)
    if type == "app-access-token"
      {
        "Authorization" => ENV["APP_ACCESS_TOKEN"],
        "Client-id" => ENV["CLIENT_ID"]
      }
    elsif type == "user-access-token"
      {
        "Authorization" => current_user.user_access_token,
        "Client-id" => ENV["CLIENT_ID"]
      }
    elsif type == "www-form"
      {
        'Content-Type': "application/x-www-form-urlencoded"
      }
    end
  end
end
