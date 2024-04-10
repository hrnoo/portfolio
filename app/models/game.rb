class Game < ApplicationRecord
  belongs_to :user
  attachment :game_image
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
