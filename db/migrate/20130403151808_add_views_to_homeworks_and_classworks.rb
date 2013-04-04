class AddViewsToHomeworksAndClassworks < ActiveRecord::Migration
  def up
    change_table :homeworks do |t|
      t.integer :views
    end
    
    change_table :classworks do |t|
      t.integer :views
    end
  end
  
  def down
    remove_column :homeworks, :views
    remove_column :classworks, :views
  end
end
