require 'rails_helper'

RSpec.describe Broadcaster, type: :model do
  it 'idなしでBroadcasterモデルが生成できない' do
    user = User.new(id: nil)
    expect(user).not_to be_valid
  end

  it '同じidのBroadcasterモデルが登録できない' do
    user1 = User.create(id: nil)
    user2 = User.new(id: nil)
    expect(user2).not_to be_valid
  end
end
