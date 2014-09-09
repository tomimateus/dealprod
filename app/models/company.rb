class Company < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :branches
  has_and_belongs_to_many :clients

  attr_accessible :cuit, :name, :user_id, :user_attributes, :branches_attributes

  validates_presence_of :name, :user

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 50}

  validates_associated :user

  accepts_nested_attributes_for :user, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['email'].blank? or
                                      attributes['password'].blank?
                                }


  accepts_nested_attributes_for :branches, :allow_destroy => true

  def email
    self.user.email unless self.user.nil?
  end

  def earned_money
    total = 0
    Offer.where(:branch_id => self.branches.select(:id)).each do |o|
      clients_offer = ClientsOffer.where(:offer_id => o.id).all
      prices = Prize.where(:offer_id => o.id).all
      clients_offer.each do |c|
          if c.participated
            position = c.position
            total += prices.at(position-1).discounted_price
          end
      end
    end
    return total
  end

end
