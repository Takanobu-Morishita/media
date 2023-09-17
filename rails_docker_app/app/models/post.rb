class Post < ApplicationRecord
  validates :user_id, {presence: true}
  belongs_to :user

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
