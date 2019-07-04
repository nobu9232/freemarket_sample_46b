class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :product, null: :false, foreign_key: :true
      t.string :file, null: :false
      t.timestamps
    end
  end
end
