class AddAdminFieldToSites < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.boolean :admin, :default => false
    end
  end
  
  def down
    remove_column :users, :admin
  end
end
