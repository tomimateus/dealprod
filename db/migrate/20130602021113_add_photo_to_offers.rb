class AddPhotoToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :photo, :string
  end
end
