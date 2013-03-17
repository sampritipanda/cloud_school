class CreateHomeworks < ActiveRecord::Migration
  def up
    create_table :homeworks do |t|
      t.string :subject
      t.string :chapter
      t.date :issue_date
      t.date :submission_date
      t.text :content
      t.belongs_to :site
    end
  end
  
  def down
    drop_table :homeworks
  end
end
