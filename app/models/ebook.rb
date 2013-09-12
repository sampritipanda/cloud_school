class Ebook < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  
  attr_accessible :name, :book
  has_attached_file :book

  validates_presence_of :name, :book
  validates_attachment :book, :presence => true,
    :content_type => { :content_type => "application/pdf" },
    :size => { :in => 0..10.megabytes }
end
