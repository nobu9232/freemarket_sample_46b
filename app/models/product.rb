class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :saler_user, class_name: "User"
  belongs_to :buyer_user, class_name: "User"

  # 取引段階enum
  enum status: { "出品中":0, "取引中":1, "落札済":2, "発送中":3, "取引終了":4}

  # 発送日数enum
  enum shipping_days: { "---":0, "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3}

  # 配送料負担enum
  enum shipping_charge: { "---":0, "送料込み（出品者負担）":1, "着払い（購入者負担）":2}, _suffix: true

  # 商品の状態enum
  enum condition: { "---":0, "新品。未使用":1, "未使用に近い":2, "目立った傷や汚れなし":3, "やや傷や汚れあり":4, "傷や汚れあり":5, "全体的に状態が悪い":6}, _suffix: true

  # カテゴリーとのアソシエーション
  has_many :categories, through: :products_categories, dependent: :destroy
  has_many :products_categories

  # 都道府県active_hash
  belongs_to_active_hash :prefecture, class_name: "Prefecture", foreign_key: "ship_form_location"

  # 配送方法active_hash
  belongs_to_active_hash :shipping_method, class_name: "Shipping_method", foreign_key: "shipping_method"

  # サイズactive_hash
  belongs_to_active_hash :size, class_name: "Size", foreign_key: "size"

  belongs_to :brand
  has_many :images, class_name: "Image", dependent: :destroy


end
