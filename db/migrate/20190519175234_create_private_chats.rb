class CreatePrivateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :private_chats do |t|
      t.integer :user_1_id, null: false, foreign_key: true
      t.integer :user_2_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
