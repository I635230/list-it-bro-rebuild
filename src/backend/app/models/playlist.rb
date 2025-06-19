class Playlist < ApplicationRecord
  # 他モデルとの関係
  belongs_to :user

  # バリデーション
  validates :slug, presence: true, uniqueness: true
  validates :public, presence: true
end
