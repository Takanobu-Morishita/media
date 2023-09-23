class Post < ApplicationRecord
  validates :user_id, {presence: true}
  belongs_to :user

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  scope :old, -> { order(created_at: :asc) }  #asc = 昇順
end
