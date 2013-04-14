class Homework < ActiveRecord::Base
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
  
  belongs_to :site
  
  attr_accessible :subject, :chapter, :issue_date, :submission_date, :content, :views
end
