class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :seller_user_id, foreign_key: true, 
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.integer :parent_id
      t.timestamps
    end
  end
end
