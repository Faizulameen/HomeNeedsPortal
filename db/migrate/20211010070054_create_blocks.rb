class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :fullname
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.integer :pin
      t.string :cardname
      t.integer :cardno
      t.string :expmonth
      t.integer :expyear
      t.integer :cvv
      t.integer :user_id
      t.integer :worker_id

      t.timestamps
    end
  end
end
