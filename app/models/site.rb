class Site < ActiveRecord::Base
  has_many :users
  has_many :classworks
  
  attr_accessible :name, :url, :code
  
  validates_presence_of :name, :url, :code
end
