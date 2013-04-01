class AddAttachmentBookToEbooks < ActiveRecord::Migration
  def self.up
    change_table :ebooks do |t|
      t.attachment :book
    end
  end

  def self.down
    drop_attached_file :ebooks, :book
  end
end
