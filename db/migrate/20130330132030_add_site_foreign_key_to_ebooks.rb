class AddSiteForeignKeyToEbooks < ActiveRecord::Migration
  def up
    change_table :ebooks do |t|
      t.belongs_to :site
    end
  end
  
  def down
    remove_column :ebooks, :site_id
  end
end
