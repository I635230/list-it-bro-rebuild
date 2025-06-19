require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it '同じplaylistとuserのペアを登録できない' do
    playlist = create(:playlist)
    user = create(:user)
    favorite1 = create(:favorite, playlist: playlist, user: user)
    favorite2 = build(:favorite, playlist: playlist, user: user)
    expect(favorite2).not_to be_valid
  end
end
