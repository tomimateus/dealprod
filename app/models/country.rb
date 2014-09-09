class Country < ActiveRecord::Base
  has_many :addresses

  attr_accessible :name
end
