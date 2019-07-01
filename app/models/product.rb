class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :saler_user, class_name: "User"
  belongs_to :buyer_user, class_name: "User"

  # 商品の状態enum
  enum status: { "出品中":0, "取引中":1, "落札済":2, "発送中":3, "取引終了":4}

  # 商品の状態enum
  enum days: { "---":'', "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3}

  # カテゴリーとのアソシエーション
  has_many :categories, through: :products_categories, dependent: :destroy
  has_many :products_categories

  # 都道府県active_hash
  belongs_to_active_hash :prefecture, class_name: "Prefecture", foreign_key: "ship_form_location"

  # belongs_to :brand
  # has_many :product_images, dependent: :destroy


end
