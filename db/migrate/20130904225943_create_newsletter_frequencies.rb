class CreateNewsletterFrequencies < ActiveRecord::Migration
  def change
    create_table :newsletter_frequencies do |t|
      t.string :name
      t.integer :days

      t.timestamps
    end
    add_column :clients, :newsletter_frequency_id, :integer, :default => 4
  end
end
