class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites,dependent: :destroy
  has_many :book_comments,dependent: :destroy
  validates :title,presence: true
  validates :body,presence: true
  validates :body,length: {maximum: 200}
  
  def favorites_by?(user,book)
    favorites.where(user_id: user.id,book_id: book.id).exists?
  end
end
