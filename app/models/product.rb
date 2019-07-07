class Product < ApplicationRecord
  belongs_to :saler_user, class_name: "User"
  belongs_to :buyer_user, class_name: "User"
  has_many   :product_images, class_name: "ProductImage", dependent: :destroy
  has_many   :categories, through: :products_categories, dependent: :destroy
  has_many   :products_categories, class_name: "ProductsCategorie"
  enum status: { "draft":0, "exhibition":1, "bid":2, "transferred":3, "sent":4}
  # belongs_to :brand

end
