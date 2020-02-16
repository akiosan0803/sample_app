class Product < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  has_one_attached :image
  validates :image, file_size: { in: 100.kilobytes..1.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png'] }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  
  

end
