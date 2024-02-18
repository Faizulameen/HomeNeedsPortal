class AddWorkerIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :worker_id, :integer
  end
end
