require 'rails_helper'

RSpec.describe User, type: :model do
  it 'idなしでUserモデルが生成できない' do
    user = build(:user, id: nil)
    expect(user).not_to be_valid
  end

  it '同じidのUserモデルが登録できない' do
    user1 = create(:user, id: 1)
    user2 = build(:user, id: 1)
    expect(user2).not_to be_valid
  end

  it 'playlistをfavできる' do
    user = create(:user)
    playlist = create(:playlist)
    user.favorite(playlist)
    expect(user.fav_playlists).to include(playlist)
  end

  it 'playlistのfavを解除できる' do
    user = create(:user)
    playlist = create(:playlist)    
    user.favorite(playlist)
    user.unfavorite(playlist)
    expect(user.fav_playlists).not_to include(playlist)
  end

  it 'playlistをfavしているか確認できる' do
    user = create(:user)
    playlist = create(:playlist)
    user.favorite(playlist)
    expect(user.favorited?(playlist)).to eq(true)
  end
end
