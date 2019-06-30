class ChangeColumnTypeProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :size, :integer
    change_column :products, :condition, :integer, null: :false
    change_column :products, :shipping_charge, :integer, null: :false
    change_column :products, :shipping_method, :integer, null: :false
    change_column :products, :ship_form_location, :integer, null: :false
    change_column :products, :shipping_days, :integer, null: :false

  end
end
