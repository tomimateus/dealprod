class AddsGmapsColumnToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :gmaps, :string
  end
end
