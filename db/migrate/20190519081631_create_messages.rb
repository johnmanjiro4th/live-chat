class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :user_id, foreign_key: true
      t.integer :private_chat_id, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
