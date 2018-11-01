class Item < ApplicationRecord
  validates :title, presence: true, length: {maximum: 255}
  validates :url, presence: true, length: {maximum: 255}
  validates :image_url, presence: true, length: {maximum: 255}
  validates :isbn, presence: true, length: {maximum: 255}
end
