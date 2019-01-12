class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change

  add_column :users, :name, :string, null: false
  add_column :users, :name_kana, :string, null: false
  add_column :users, :introduction, :text
  add_column :users, :postal_code, :string, null: false
  add_column :users, :address, :text, null: false
  add_column :users, :phone_number, :string, null: false
  add_column :users, :point, :integer, default: 0
  add_column :users, :image_id, :string
  add_column :users, :is_active, :boolean, null: false, default: true
  add_column :users, :admin, :boolean, null: false, default: false
  end
end
