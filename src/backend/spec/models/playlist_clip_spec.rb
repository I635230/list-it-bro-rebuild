require 'rails_helper'

RSpec.describe PlaylistClip, type: :model do
  it '同じplaylistとclipのペアを登録できない' do
    playlist = create(:playlist)
    clip = create(:clip)
    playlist_clip1 = create(:playlist_clip, playlist: playlist, clip: clip)
    playlist_clip2 = build(:playlist_clip, playlist: playlist, clip: clip)
    expect(playlist_clip2).not_to be_valid
  end

  it 'orderなしでplaylist_clipモデルを生成できない' do
    playlist = create(:playlist)
    clip = create(:clip)
    playlist_clip = build(:playlist_clip, playlist: playlist, clip: clip, order: nil)
    expect(playlist_clip).not_to be_valid
  end
end
