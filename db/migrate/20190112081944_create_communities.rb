class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|

      t.string :name, null: false
      t.integer :artist_id, null: false
      t.text :introduction
      t.string :image_id
      t.boolean :is_active, null: false, default: false
      t.timestamps
    end
  end
end
