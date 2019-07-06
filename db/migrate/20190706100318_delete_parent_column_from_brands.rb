class DeleteParentColumnFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :parent_id, :integer
  end
end
