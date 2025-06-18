require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'idなしでゲームを生成できない' do
    game = build(:game, id: nil)
    expect(game).not_to be_valid
  end

  it '同じidのゲームを登録できない' do
    game1 = create(:game, id: 1)
    game2 = build(:game, id: 1)
    expect(game2).not_to be_valid
  end
end
