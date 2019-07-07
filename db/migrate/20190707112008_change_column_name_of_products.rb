class ChangeColumnNameOfProducts < ActiveRecord::Migration[5.2]
  def up
    remove_column :products, :ship_form_location
    add_column :products, :prefecture_id, :integer, null: false
    remove_column :products, :shipping_method
    add_column :products, :shipping_method_id, :integer, null: false
  end
  def down
    remove_column :products, :prefecture_id
    add_column :products, :ship_form_location, :integer, null: false
    remove_column :products, :shipping_method_id
    add_column :products, :shipping_method, :integer, null: false
  end
end
