class Announcement < ActiveRecord::Base
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
  
  belongs_to :site
  
  attr_accessible :content, :title
end
