class CreateClientsCompanies < ActiveRecord::Migration
  def change
    create_table :clients_companies do |t|
      t.integer :client_id
      t.integer :company_id
      t.integer :weight

      t.timestamps
    end
  end
end
