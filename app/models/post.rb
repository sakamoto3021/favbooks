class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {in:200..5000}
  validates :content_title, presence: true, length: {maximum:255}
  validates :book_title, presence: true, length: {maximum:255}
  validates :netabare, inclusion: { in: [true, false] }
  validates :author, presence: true
  
  
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :item
end
