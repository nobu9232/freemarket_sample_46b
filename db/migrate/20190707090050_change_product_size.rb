class ChangeProductSize < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :size
    add_column :products, :size_id, :integer, null: false
  end
end
