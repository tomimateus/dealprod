class AddDescriptionToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :description, :text
  end
end
