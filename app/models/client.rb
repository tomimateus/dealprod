class Client < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_and_belongs_to_many :titles
  has_one :address
  has_and_belongs_to_many :offers
  belongs_to :newsletter_frequency
  has_and_belongs_to_many :companies

  attr_accessible :first_name, :last_name, :user_id, :address_attributes, :titles, :newsletter_frequency_id

  accepts_nested_attributes_for :address, :allow_destroy => true

  validates_presence_of :user

  def prefer(preference)
    prefer = false
    self.titles.each do |p|
      if preference == p.name
        prefer = true
      end
    end
    return prefer
  end

  def preferences
    ClientsTitles.where(:client_id => self.id).select("title_id, weight")
  end

  def saved_money
    total = 0
    offers_ids = ClientsOffer.select(:offer_id).where(:client_id => self.id)
    offers = Offer.where(:id => offers_ids ).all
    offers.each do |o|
      #prices = Prize.where(:offer_id => o.id).all
        prices = Prize.where(:offer_id => o.id).all
        clients_offer = ClientsOffer.where(:offer_id => o.id, :client_id => self.id).all
        clients_offer.each do |c|
          if c.participated
            position = c.position
            total += prices.at(position-1).discounted_price
          end
        end
    end
    return total
  end

  def real
    total = 0
    offers_ids = ClientsOffer.select(:offer_id).where(:client_id => self.id)
    offers = Offer.where(:id => offers_ids ).all
    offers.each do |o|
      #prices = Prize.where(:offer_id => o.id).all
      prices = Prize.where(:offer_id => o.id).all
      clients_offer = ClientsOffer.where(:offer_id => o.id, :client_id => self.id).all
      clients_offer.each do |c|
        if c.participated
          position = c.position
          total += prices.at(position-1).real_price
        end
      end
    end
    return total
  end

  def spent_money
    a = real - saved_money

    return a
  end

  def win
    total = 0
    offers_ids = ClientsOffer.select(:offer_id).where(:client_id => self.id)
    offers = Offer.where(:id => offers_ids ).all
    offers.each do |o|
      #prices = Prize.where(:offer_id => o.id).all
      prices = Prize.where(:offer_id => o.id).all
      clients_offer = ClientsOffer.where(:offer_id => o.id, :client_id => self.id).all
      clients_offer.each do |c|
        if c.participated
          total += 1
        end
      end
    end
    return total
  end

  def lose
    total = 0
    offers_ids = ClientsOffer.select(:offer_id).where(:client_id => self.id)
    offers = Offer.where(:id => offers_ids ).all
    offers.each do |o|
      #prices = Prize.where(:offer_id => o.id).all
      prices = Prize.where(:offer_id => o.id).all
      clients_offer = ClientsOffer.where(:offer_id => o.id, :client_id => self.id).all
      clients_offer.each do |c|
        total += 1 if c.participated == false
      end
    end
    return total
  end


end
