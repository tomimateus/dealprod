class UserRole < ActiveRecord::Base
  has_many :user

  attr_accessible :name
end
