class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {in:200..5000}
  validates :content_title, presence: true, length: {maximum:255}
  validates :book_title, presence: true, length: {maximum:255}
  
  has_many :favorites
  has_many :users, through: :favorites
end
