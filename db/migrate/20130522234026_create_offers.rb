class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :company_id
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
