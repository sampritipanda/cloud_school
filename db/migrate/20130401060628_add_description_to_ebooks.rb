class AddDescriptionToEbooks < ActiveRecord::Migration
  def change
    change_table :ebooks do |t|
      t.text :description
    end
  end
end
