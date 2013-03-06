class Classwork < ActiveRecord::Base
  belongs_to :site
  
  attr_accessible :date, :content
end
