class AddStatusToBlocks < ActiveRecord::Migration[5.2]
  def change
    add_column :blocks, :status, :string
  end
end
