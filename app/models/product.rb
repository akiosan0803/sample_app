class Product < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  has_one_attached :image
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
