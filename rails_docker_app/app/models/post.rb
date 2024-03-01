class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :user_id, {presence: true}
  belongs_to :user

  has_one_attached :url_image
  has_one :notification, as: :subject, dependent: :destroy

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  scope :old, -> { order(created_at: :asc) }  #asc = 昇順
end
