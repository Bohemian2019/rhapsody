class CreateUsersCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :users_communities do |t|

      t.integer :user_id, null: false
      t.integer :community_id, null: false
      t.timestamps
    end
  end
end
