class Address < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :client, :dependent => :destroy
  belongs_to :branch, :dependent => :destroy
  belongs_to :country

  attr_accessible :city, :country_id, :country, :floor, :number, :state, :street, :client_id, :branch_id, :address, :longitude, :latitude

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.street} #{self.number}, #{self.city}"
    #"#{self.street} #{self.number}, #{self.city}, #{self.country.name}"
  end


  def gmaps4rails_infowindow
    unless self.branch.nil?
    "<a href='#{users_home_view_path}'><img src='/assets/bag2.png' width='25' height='22px'> #{self.branch.name}</a>"
    end
  end

end
