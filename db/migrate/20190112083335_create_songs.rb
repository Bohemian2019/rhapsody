class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|

      t.integer :item_id, null: false
      t.integer :disc_number, null: false, defaul: 1
      t.integer :song_number
      t.timestamps
    end
  end
end
