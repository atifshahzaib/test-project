class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :shipments, through: :orders
  validates :full_name, presence: true, length: { minimum: 6, maximum: 25 }

  def thumbnail(width)
    image.variant(resize: width).processed if image.attached?
  end
end
