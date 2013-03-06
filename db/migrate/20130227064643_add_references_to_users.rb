class AddReferencesToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.belongs_to :site
    end
  end
 
 def down
   remove_column :users, :site_id
 end
end
