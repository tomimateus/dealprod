class ClientsTitles < ActiveRecord::Base
  has_one :client
  has_one :title

  attr_accessible :client_id, :title_id, :weight
end