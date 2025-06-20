class User < ApplicationRecord
  # 他モデルとの関係
  has_many :playlists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_playlists, through: :favorites, source: :playlist

  # バリデーション
  validates :id, presence: true, uniqueness: true

  # メソッド
  def favorite(playlist)
    self.fav_playlists << playlist
  end

  def unfavorite(playlist)
    self.fav_playlists.destroy(playlist)
  end

  def favorited?(playlist)
    self.fav_playlists.exists?(playlist.id)
  end
end
