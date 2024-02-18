class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :image
      t.string :name
      t.string :email
      t.text :address
      t.string :role
      t.integer :experience
      t.string :phone

      t.timestamps
    end
  end
end
