class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :artist_id, null: false, foreign_key: true
      t.string :item_name, null: false
      t.string :image_id
      t.integer :price, null: false
      t.integer :label_id
      t.string :genre, null: false
      t.integer :stock, default: 0
      t.timestamps
    end
  end
end
