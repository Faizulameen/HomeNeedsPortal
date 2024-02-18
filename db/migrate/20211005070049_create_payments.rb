class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :fullname
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :pin
      t.string :cardname
      t.string :cardno
      t.string :expmonth
      t.integer :expyear
      t.integer :cvv

      t.timestamps
    end
  end
end
