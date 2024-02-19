class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites
  has_many :favorites_posts, through: :favorites, source: :post
  has_many :bookmarks
  has_many :bookmarks_posts, through: :bookmarks, source: :post

  enum role: { general: 0, admin: 1 }

  def mine?(object)
    object.user_id == id
  end
  
  def favorite(post)
    favorites_posts << post
  end

  def unfavorite(post)
    favorites_posts.destroy(post)
  end

  def favorite?(post)
    favorites_posts.include?(post)
  end

  def bookmark(post)
    bookmarks_posts << post
  end

  def unbookmark(post)
    bookmarks_posts.destroy(post)
  end

  def bookmark?(post)
    bookmarks_posts.include?(post)
  end

  def full_name
    "#{username}"
  end
end
