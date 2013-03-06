class CreateClassworks < ActiveRecord::Migration
  def up
    create_table :classworks do |t|
      t.date :date
      t.text :content
      
      t.timestamps
    end
  end

  def down
    drop_table :classworks
  end
end