class AddWeightsToClientsTitles < ActiveRecord::Migration
  def change
    add_column :clients_titles, :weight, :integer
  end
end
