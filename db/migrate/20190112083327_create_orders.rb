class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :shopping_cart_id, null: false
      t.integer :payment, null: false
      t.integer :status, null: false
      t.string :postal_code, null: false
      t.text :address, null: false 
      t.timestamps
    end
  end
end
