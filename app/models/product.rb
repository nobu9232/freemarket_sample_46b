class Product < ApplicationRecord
  belongs_to :saler_user, class_name: "User"
  belongs_to :buyer_user, class_name: "User"
  # has_many :categories, through: :products_categories, dependent: :destroy
  # has_many :products_categories
  # belongs_to :brand
  # has_many :product_images, dependent: :destroy


end
