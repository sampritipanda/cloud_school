class Announcement < ActiveRecord::Base
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
  
  belongs_to :site
end
