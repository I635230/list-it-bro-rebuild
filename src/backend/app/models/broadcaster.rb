class Broadcaster < ApplicationRecord
  # 他モデルとの関係
  has_many :clips, dependent: :destroy

  # バリデーション
  validates :id, presence: true, uniqueness: true
end
