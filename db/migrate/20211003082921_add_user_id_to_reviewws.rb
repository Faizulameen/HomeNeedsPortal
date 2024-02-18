class AddUserIdToReviewws < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewws, :user_id, :integer
  end
end
