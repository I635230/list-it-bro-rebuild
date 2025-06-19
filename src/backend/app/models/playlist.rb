class Playlist < ApplicationRecord
  # 他モデルとの関係
  belongs_to :user
  has_many :playlist_clips, dependent: :destroy
  has_many :clips, through: :playlist_clips

  # バリデーション
  validates :slug, presence: true, uniqueness: true
  validates :public, presence: true
end
