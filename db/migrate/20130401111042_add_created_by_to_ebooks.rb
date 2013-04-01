class AddCreatedByToEbooks < ActiveRecord::Migration
  def up
    change_table :ebooks do |t|
      t.belongs_to :user
    end
  end
  
  def down
    remove_column :ebooks, :user_id
  end
end
