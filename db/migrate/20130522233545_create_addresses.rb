class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :country_id
      t.string :city
      t.string :state
      t.string :street
      t.integer :number
      t.string :floor

      t.timestamps
    end
  end
end
