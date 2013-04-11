class AddSampritiFieldToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :sampriti
    end
  end
end
