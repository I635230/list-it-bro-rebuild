class Playlist < ApplicationRecord
  # 代理IDの設定
  include FriendlyId
  friendly_id :slug, use: :finders

  # 他モデルとの関係
  belongs_to :user
  has_many :playlist_clips, dependent: :destroy
  has_many :clips, through: :playlist_clips
  has_many :favorites, dependent: :destroy
  has_many :fav_users, through: :favorites, source: :user

  # バリデーション
  validates :slug, uniqueness: true
  validates :public, presence: true

  # コールバック
  before_create { self.slug = SecureRandom.uuid }
  before_save { self.search_keywords = "#{self&.title} #{self.user&.display_name}" }
end
