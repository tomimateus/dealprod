class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.integer :offer_id
      t.string :name
      t.decimal :real_price
      t.decimal :discount_percentage

      t.timestamps
    end
  end
end
