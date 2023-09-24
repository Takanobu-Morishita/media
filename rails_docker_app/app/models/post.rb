class Post < ApplicationRecord
  validates :user_id, {presence: true}
  belongs_to :user

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  # 検索方法分岐
  def self.looks(search, word, genre)
    if word.present? && genre.present?
      if search == "perfect_match"
        @post = Post.where("title LIKE ? AND genre = ?", "#{word}", genre)
      elsif search == "forward_match"
        @post = Post.where("title LIKE ? AND genre = ?", "#{word}%", genre)
      elsif search == "backward_match"
        @post = Post.where("title LIKE ? AND genre = ?", "%#{word}", genre)
      elsif search == "partial_match"
        @post = Post.where("title LIKE ? AND genre = ?", "%#{word}%", genre)
      else
        @post = Post.all
      end
    elsif word.present?
      if search == "perfect_match"
        @post = Post.where("title LIKE ?", "#{word}")
      elsif search == "forward_match"
        @post = Post.where("title LIKE ?", "#{word}%")
      elsif search == "backward_match"
        @post = Post.where("title LIKE ?", "%#{word}")
      elsif search == "partial_match"
        @post = Post.where("title LIKE ?", "%#{word}%")
      else
        @post = Post.all
      end
    elsif genre.present?
      @post = Post.where(genre: genre)
    else
      @post = Post.all
    end
  end
  
  scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  scope :old, -> { order(created_at: :asc) }  #asc = 昇順

end
