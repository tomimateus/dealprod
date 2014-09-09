class CreateClientsTitlesTable < ActiveRecord::Migration
  def change
    create_table :clients_titles do |t|
      t.references :client
      t.references :title

    end
    add_index :clients_titles, :title_id
    add_index :clients_titles, :client_id
  end
end
