class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand_name, null: false
      t.timestamps
    end
    add_index :brands, :brand_name, unique: true
  end
end
