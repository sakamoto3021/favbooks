class Item < ApplicationRecord
  validates :title, presence: true, length: {maximum: 255}
  validates :url, presence: true, length: {maximum: 255}
  validates :image_url. presence, length: {maximum: 255}
end
