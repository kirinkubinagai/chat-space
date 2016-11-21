class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.references :user,foreign_key: :user_id
      t.references :chat_group,foreign_key: :chat_group_id
      t.timestamps
    end
  end
end
