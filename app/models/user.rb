class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  validates :avatar, file_size: { in: 1.kilobytes..1.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  validates :nickname, presence: true, length: { maximum: 6 }
end
