class Clip < ApplicationRecord
  # 他モデルとの関係
  belongs_to :broadcaster
  belongs_to :game

  # バリデーション
  validates :slug, presence: true, uniqueness: true
end
