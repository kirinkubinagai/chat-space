class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:name,:string,null: false
    # add_column :users,:group_id,:references,foreign_keys: true
  end
end
