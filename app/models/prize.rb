class Prize < ActiveRecord::Base
  belongs_to :offer

  attr_accessible :discount_percentage, :name, :offer_id, :real_price

  def discounted_price
    ((100 - self.discount_percentage)* self.real_price) / 100
  end
end
