require 'rails_helper'

RSpec.describe User, type: :model do
  it 'idなしでUserモデルが生成できない' do
    user = build(:user, id: nil)
    expect(user).not_to be_valid
  end

  it '同じidのUserモデルが登録できない' do
    user1 = create(:user, :user1, id: 1)
    user2 = build(:user, :user2, id: 1)
    expect(user2).not_to be_valid
  end
end
