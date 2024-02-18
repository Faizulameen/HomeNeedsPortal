class AddProductIdToReviewws < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewws, :product_id, :integer
  end
end
