class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer :cart_id, null: false
      t.integer :item_id, null: false
      t.integer :price
      t. integer :quantity, null: false, default: 1
      t.timestamps
    end
  end
end
