class AddReferencesForClassworks < ActiveRecord::Migration
  def up
    change_table :classworks do |t|
      t.belongs_to :site
    end
  end

  def down
    remove_column :classworks, :site_id
  end
end
