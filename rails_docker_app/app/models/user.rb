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
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :post_comments, dependent: :destroy

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

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
