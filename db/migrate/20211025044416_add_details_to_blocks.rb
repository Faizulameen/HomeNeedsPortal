class AddDetailsToBlocks < ActiveRecord::Migration[5.2]
  def change
    add_column :blocks, :from, :date
    add_column :blocks, :to, :date
  end
end
