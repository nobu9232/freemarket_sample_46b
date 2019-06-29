class Product < ApplicationRecord
  belongs_to :saler_user, class_name: "User"
  belongs_to :buyer_user, class_name: "User"
  enum status: { "下書き":0, "出品中":1, "落札":2, "振込み済":3, "発送済":4}
  # has_many :categories, through: :products_categories, dependent: :destroy
  # has_many :products_categories
  # belongs_to :brand
  # has_many :product_images, dependent: :destroy


end
