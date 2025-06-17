require 'rails_helper'

RSpec.describe Broadcaster, type: :model do
  it 'idなしでBroadcasterモデルが生成できない' do
    broadcaster = build(:broadcaster, id: nil)
    expect(broadcaster).not_to be_valid
  end

  it '同じidのBroadcasterモデルが登録できない' do
    broadcaster1 = create(:broadcaster, id: 1)
    broadcaster2 = build(:broadcaster, id: 1)
    expect(broadcaster2).not_to be_valid
  end
end
