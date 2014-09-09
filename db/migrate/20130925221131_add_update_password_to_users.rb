class AddUpdatePasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :update_password, :boolean
  end
end
