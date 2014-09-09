class Branch < ActiveRecord::Base
  belongs_to :company
  has_one :address
  has_many :offers

  attr_accessible :company_id, :name, :address_attributes
  validates_presence_of :company_id
  validates :name, :presence => true, :length => { :minimum => 4, :maximum => 25}

  accepts_nested_attributes_for :address, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['country_id'].blank? and
                                      attributes['street'].blank?
                                }


  def address_as_string
    unless self.address.nil?
      address = Address.where("branch_id = ?", self.id).first
      address.street + " " + address.number.to_s + " - " + address.city + ", " + address.state
    end
  end


end
