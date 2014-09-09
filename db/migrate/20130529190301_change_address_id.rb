class ChangeAddressId < ActiveRecord::Migration
  def change
    remove_column :clients, :address_id
    add_column :addresses, :client_id, :integer
  end
end
