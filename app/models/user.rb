class User < ApplicationRecord
  before_save {self.email.downcase!}
  
  validates :name, presence: true, length: {maximum:50}
  validates :email, presence: true, length: {maximum:255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
                    uniqueness: {case_sensitive: false}
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  def like(post)
    favorites.find_or_create_by(post_id: post.id)
  end
  
  def unlike(post)
    favorite = favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def liking?(post)
    self.fav_posts.include?(post)
  end
end
