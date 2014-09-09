class OffersTitles < ActiveRecord::Base
  has_one :offer
  has_one :title

  attr_accessible :offer_id, :title_id

end