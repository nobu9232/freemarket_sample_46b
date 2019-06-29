class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :seller_user_id, null:false, foreign_key: true
      t.integer :buyer_user_id, foreign_key: true
      t.references :brand, foreign_key:true
      t.string :product_name, null: false, index: true
      t.text :product_text, null: false
      t.string :product_condition, null: false
      t.integer :sales_price, null: false
      t.string :product_size
      t.string :shipping_charge, null: false
      t.string :shipping_method, null: false
      t.string :ship_form_location, null: false
      t.string :shipping_days, null: false
      t.date :purchase_date
      t.string :status, null: false
      t.timestamps
    end
  end
end
