class RemoveCompanyIdFromOffer < ActiveRecord::Migration
  def change
    remove_column :offers, :company_id
  end
end
