class CreateProductsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :products_categories do |t|
      t.integer :product_id, null: false, foreign_key:true
      t.integer :category_id, null: false, foreign_key:true
      t.timestamps
    end
  end
end
