class ChangeAddressAndBranchIds < ActiveRecord::Migration
  def change
    add_column :addresses, :branch_id, :integer
    remove_column :branches, :address_id
  end
end
