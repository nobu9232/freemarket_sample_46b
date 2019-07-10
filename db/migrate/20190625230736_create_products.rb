class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :seller_user_id, null:false, foreign_key: true
      t.integer :buyer_user_id, foreign_key: true
      t.string :name, null: false, index: true
      t.text :text, null: false
      t.integer :category_id, foreign_key: true
      t.integer :category_child_id, foreign_key: true
      t.integer :category_groundchild_id, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :condition, null: false
      t.integer :sales_price, null: false
      t.integer :size_id, null: false, foreign_key: true
      t.integer :shipping_charge, null: false
      t.integer :shipping_method_id, null: false, foreign_key: true
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :shipping_days, null: false
      t.date :purchase_date
      t.integer :status, null: false
      t.timestamps
    end
  end
end
