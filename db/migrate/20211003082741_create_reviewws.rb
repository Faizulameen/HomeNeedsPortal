class CreateReviewws < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewws do |t|
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
