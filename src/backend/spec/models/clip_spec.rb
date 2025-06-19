require 'rails_helper'

RSpec.describe Clip, type: :model do
  it 'slugなしでclipモデルが生成できない' do
    clip = build(:clip, slug: nil)
    expect(clip).not_to be_valid
  end

  it '同じslugのclipモデルが登録できない' do
    clip1 = create(:clip, slug: "duplicate")
    clip2 = build(:clip, slug: "duplicate")
    expect(clip2).not_to be_valid
  end
end
