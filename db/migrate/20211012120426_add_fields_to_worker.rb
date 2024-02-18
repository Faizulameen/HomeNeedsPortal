class AddFieldsToWorker < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :latitude, :float
    add_column :workers, :longitude, :float
  end
end
