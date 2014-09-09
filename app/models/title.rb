class Title < ActiveRecord::Base

  has_and_belongs_to_many :offers
  has_and_belongs_to_many :clients
  attr_accessible :name, :icon_name

  validates_presence_of :name

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 25}

  def num_clients
    num = 0
    ClientsTitles.all.each do |client_title|
      if client_title.title_id == self.id
          num += 1
      end
    end
    num
  end

  def num_offers
    num = 0
    OffersTitles.all.each do |offer_title|
      if offer_title.title_id == self.id
        num += 1
      end
    end
    num
  end

end
