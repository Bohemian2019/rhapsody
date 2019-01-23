class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      # modified 20190120 add foreigin key---------
      # t.integer :shopping_cart_id, index: true, null: false
      # t.integer :item_id, index: true, null: false
      t.references :item, foreign_key: true, null: false
      t.references :shopping_cart, foreign_key: true, null: false
      # modified 20190120 -------------------------
      t.integer :price
      t. integer :quantity, null: false, default: 1
      t.timestamps
    end
  end
end
