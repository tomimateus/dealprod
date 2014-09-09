class CreateOffersTitles < ActiveRecord::Migration
  def change
    create_table :offers_titles do |t|
      t.references :offer
      t.references :title

      t.timestamps
    end
  add_index :offers_titles, :title_id
  add_index :offers_titles, :offer_id
  end
end
