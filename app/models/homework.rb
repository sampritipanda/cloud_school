class Homework < ActiveRecord::Base
  belongs_to :site
  
  attr_accessible :subject, :chapter, :issue_date, :submission_date, :content
end
