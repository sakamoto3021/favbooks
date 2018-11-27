class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :user_id, presence: true
  validates :comment, presence: true, length: {maximum: 300}
end
