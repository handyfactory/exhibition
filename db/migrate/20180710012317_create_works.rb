class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :desc
      t.string :image
      t.integer :maker_id 

      t.timestamps null: false
    end
  end
end
