class AddFixedamountToWorker < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :fixedamount, :integer
  end
end
