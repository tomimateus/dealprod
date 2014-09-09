class NewsletterFrequency < ActiveRecord::Base
  has_many :clients
  attr_accessible :days, :name
end
