require 'rails_helper'

RSpec.describe Clip, type: :model do
  it '同じslugのclipモデルが登録できない' do
    clip1 = create(:clip, slug: "duplicate")
    clip2 = build(:clip, slug: "duplicate")
    expect(clip2).not_to be_valid
  end

  it 'broadcasterモデルなしでclipモデルが登録できない' do
    clip = build(:clip, broadcaster_id: nil)
    expect(clip).not_to be_valid
  end

  it 'gameモデルなしでclipモデルが登録できない' do
    clip = build(:clip, game_id: nil)
    expect(clip).not_to be_valid
  end
end
