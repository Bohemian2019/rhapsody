class CreateShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_carts do |t|

      t.integer :user_id, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
