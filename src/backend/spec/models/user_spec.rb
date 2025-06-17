require 'rails_helper'

RSpec.describe User, type: :model do
  it 'idなしでUserモデルが生成できない' do
    user = User.new(id: nil)
    expect(user).not_to be_valid
  end

  it '同じidのUserモデルが登録できない' do
    user1 = User.create(id: 1)
    user2 = User.new(id: 1)
    expect(user2).not_to be_valid
  end
end
