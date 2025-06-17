class Broadcaster < ApplicationRecord
  # バリデーション
  validates :id, presence: true, uniqueness: true
end
