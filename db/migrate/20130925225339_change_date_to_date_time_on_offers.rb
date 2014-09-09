class ChangeDateToDateTimeOnOffers < ActiveRecord::Migration
  def change
    remove_column :offers, :start_date
    remove_column :offers, :end_date
    add_column :offers, :start_date, :datetime
    add_column :offers, :end_date, :datetime
  end
end
