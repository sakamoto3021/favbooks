class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {in:200..1000}
  validates :content_title, presence: true, length: {maximum:255}
  validates :book_title, presence: true, length: {maximum:255}
end
