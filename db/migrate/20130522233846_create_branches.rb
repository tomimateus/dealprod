class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.integer :company_id
      t.integer :address_id
      t.string :name

      t.timestamps
    end
  end
end
