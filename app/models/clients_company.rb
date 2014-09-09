class ClientsCompany < ActiveRecord::Base
  has_one :client
  has_one :company

  attr_accessible :client_id, :company_id, :weight
end
