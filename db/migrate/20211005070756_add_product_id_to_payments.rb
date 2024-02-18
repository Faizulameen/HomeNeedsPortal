class AddProductIdToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :product_id, :integer
  end
end
