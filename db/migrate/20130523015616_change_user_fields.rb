class ChangeUserFields < ActiveRecord::Migration
  def change
    remove_column :users, :role_id
    add_column :users, :user_role_id, :integer
  end
end
