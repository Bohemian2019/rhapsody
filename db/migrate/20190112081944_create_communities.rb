class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|

      t.string :name, null: false
      t.integer :artist_id, null: false
      t.text :introduction
      t.string :image_id
      t.boolean :is_active, default: false
      t.string :community_image
      t.timestamps
    end
  end
end
