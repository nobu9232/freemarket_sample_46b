class Brand < ApplicationRecord
  has_many :products, class_name: "product", foreign_key: "brand_id"
end
