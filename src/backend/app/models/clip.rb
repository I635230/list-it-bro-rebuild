class Clip < ApplicationRecord
  # 他モデルとの関係
  belongs_to :broadcaster
  belongs_to :game

  # バリデーション
  validates :slug, uniqueness: true
  validates :broadcaster_id, presence: true
  validates :game_id, presence: true
end
