class AddBranchToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :branch_id, :integer
  end
end
