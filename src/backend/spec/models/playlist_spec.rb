require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it 'slugは保存時に自動生成される' do
    playlist = build(:playlist, slug: nil)
    playlist.save!
    expect(playlist.slug).not_to be_valid
  end

  it 'publicなしでplaylistモデルを生成できない' do
    playlist = build(:playlist, public: nil)
    expect(playlist).not_to be_valid
  end

  it 'search_keywordsへのbefore_saveが正常に機能している' do
    playlist = build(:playlist)
    expect(playlist.search_keywords).to eq(nil)
    playlist.save!
    expect(playlist.search_keywords).not_to eq(nil)
  end
end
