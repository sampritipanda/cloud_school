class AddLoginsToSites < ActiveRecord::Migration
  def change
    change_table :sites do |t|
      t.integer :logins
    end
  end
end