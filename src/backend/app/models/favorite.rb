class Favorite < ApplicationRecord
  # 他モデルとの関係
  belongs_to :playlist
  belongs_to :user

  # バリデーション
  validates :playlist_id, uniqueness: { scope: :user_id }
end
