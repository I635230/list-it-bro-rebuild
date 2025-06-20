require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it 'slugは初回保存時に自動生成される' do
    playlist = build(:playlist, slug: nil)
    playlist.save!
    expect(playlist.slug).not_to be_nil
  end

  it 'slugで検索できる' do
    playlist = create(:playlist)
    found_playlist = Playlist.friendly.find(playlist.slug)
    expect(found_playlist).to eq(playlist)
  end

  it 'publicなしでplaylistモデルを生成できない' do
    playlist = build(:playlist, public: nil)
    expect(playlist).not_to be_valid
  end

  it 'search_keywordsは保存時に自動生成される' do
    playlist = build(:playlist, search_keywords: nil)
    playlist.save!
    expect(playlist.search_keywords).not_to be_nil
  end

  it 'playlistにclipを追加できる' do
    playlist = create(:playlist)
    clip = create(:clip)
    playlist.add(clip)
    expect(playlist.clips).to include(clip)
  end

  it 'playlistからclipを削除できる' do
    playlist = create(:playlist)
    clip = create(:clip)
    playlist.add(clip)
    playlist.remove(clip)
    expect(playlist.clips).not_to include(clip)
  end

  it 'userがplaylistをfavしているか確認できる' do
    user = create(:user)
    playlist = create(:playlist)
    user.fav_playlists << playlist
    expect(playlist.favorited?(user)).to eq(true)
  end
end
