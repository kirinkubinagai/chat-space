class CreateChatGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_groups do |t|
      t.string :name,null: false
      t.references :users,foreign_key: "user_id"
      t.timestamps
    end
  end
end
