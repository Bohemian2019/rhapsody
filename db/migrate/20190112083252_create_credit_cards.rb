class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|

      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :card_number, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.timestamps
    end
  end
end
