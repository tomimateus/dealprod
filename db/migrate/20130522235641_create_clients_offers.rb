class CreateClientsOffers < ActiveRecord::Migration
  def change
    create_table :clients_offers do |t|
      t.references :offer
      t.references :client
      t.integer :position
      t.boolean :participated

      t.timestamps
    end
  add_index :clients_offers, :client_id
  add_index :clients_offers, :offer_id
  end
end
