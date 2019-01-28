class AddColumnAdministrator < ActiveRecord::Migration[5.2]
  def change
  	add_column :administrators, :is_active, :boolean, null: false, default: true
  	add_column :administrators, :admin, :boolean, default: false
  end
end
