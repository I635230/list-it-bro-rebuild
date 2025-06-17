require 'rails_helper'

RSpec.describe Broadcaster, type: :model do
  it 'idなしでBroadcasterモデルが生成できない' do
    broadcaster = Broadcaster.new(id: nil)
    expect(broadcaster).not_to be_valid
  end

  it '同じidのBroadcasterモデルが登録できない' do
    broadcaster1 = Broadcaster.create(id: 1)
    broadcaster2 = Broadcaster.new(id: 1)
    expect(broadcaster2).not_to be_valid
  end
end
