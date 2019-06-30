class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :saler_user, class_name: "User"
  belongs_to :buyer_user, class_name: "User"
  enum status: { "draft":0, "exhibition":1, "bid":2, "transferred":3, "sent":4}

  # カテゴリーとのアソシエーション
  has_many :categories, through: :products_categories, dependent: :destroy
  has_many :products_categories

  # 都道府県active_hash
  belongs_to_active_hash :prefecture, class_name: "Prefecture", foreign_key: "ship_form_location"

  # belongs_to :brand
  # has_many :product_images, dependent: :destroy


end
