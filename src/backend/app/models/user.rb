class User < ApplicationRecord
  # 他モデルとの関係
  has_many :favorites, dependent: :destroy
  has_many :fav_playlists, through: :favorites, source: :playlist

  # バリデーション
  validates :id, presence: true, uniqueness: true
end
