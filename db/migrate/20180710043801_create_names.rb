class CreateNames < ActiveRecord::Migration
  def change
    create_table :makers do |t|
      t.string :name
      t.string :phone_number
      t.string :email

      t.timestamps null: false
    end
  end
end
