class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  validates :images, file_size: { in: 100.kilobytes..1.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  
end
