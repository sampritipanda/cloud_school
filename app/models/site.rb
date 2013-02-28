class Site < ActiveRecord::Base
  has_many :users
  
  attr_accessible :name, :url, :code
end
