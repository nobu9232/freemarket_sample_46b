class Categorie < ApplicationRecord
  has_many :products, through: :products_categories, dependent: :destroy
  has_many :products_categories, class_name: "ProductsCategori"
end
