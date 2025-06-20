class Game < ApplicationRecord
  # 他モデルとの関係
  has_many :clips

  # バリデーション
  validates :id, presence: true, uniqueness: true
end
