require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it 'slugなしでplaylistモデルを生成できない' do
    playlist = build(:playlist, slug: nil)
    expect(playlist).not_to be_valid
  end

  it '同じslugのplaylistモデルを登録できない' do
    playlist1 = create(:playlist, slug: "duplicate")
    playlist2 = build(:playlist, slug: "duplicate")
    expect(playlist2).not_to be_valid
  end

  it 'publicなしでplaylistモデルを生成できない' do
    playlist = build(:playlist, slug: nil)
    expect(playlist).not_to be_valid
  end
end
