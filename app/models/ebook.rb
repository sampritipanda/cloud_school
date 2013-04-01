class Ebook < ActiveRecord::Base
  
  
  belongs_to :site
  
  attr_accessible :name, :book
  has_attached_file :book
  
  validates_presence_of :name, :book
end
