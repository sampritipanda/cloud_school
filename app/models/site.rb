class Site < ActiveRecord::Base
  has_many :users
  has_many :classworks
  has_many :homeworks
  has_many :ebooks
  has_many :announcements
  
  attr_accessible :name, :url, :code
  
  validates_presence_of :name, :url, :code
  validates_uniqueness_of :name, :url, :code
end
