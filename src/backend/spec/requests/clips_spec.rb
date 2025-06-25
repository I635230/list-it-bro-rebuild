require 'rails_helper'

RSpec.describe "Clips", type: :request do
  describe "GET /clips/:id" do
    before do
      # 必要なインスタンスの作成
      broadcaster = create(:broadcaster)
      game = create(:game)
      @clip = create(:clip, broadcaster: broadcaster, game: game)
    end

    it 'clipを取得できる' do
      get clip_path(@clip.slug)
      data = JSON.parse(response.body)
      expect(data["slug"]).to eq(@clip.slug)
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /clips/:id" do
    before do
      # 必要なインスタンスの作成
      broadcaster = create(:broadcaster)
      game = create(:game)
      @clip = create(:clip, broadcaster: broadcaster, game: game)

      # 準備
      @view_count = 100

      # TwitchAPIへのリクエストモック
      stub_request(:get, "https://api.twitch.tv/helix/clips?id=#{@clip.slug}")
        .to_return(
          status: 200,
          body: { data: [ { view_count: @view_count } ] }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )
    end

    it 'clipを更新できる' do
      patch clip_path(@clip.slug)
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(data["view_count"]).to eq(@view_count)
    end
  end
end
