class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :self_introduction, :text
    add_column :users, :point, :integer
    add_index :users, :nickname, unique: true
  end
end
