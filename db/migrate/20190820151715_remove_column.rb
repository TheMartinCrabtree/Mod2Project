class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :dungeonmasters, :password, :string
  end
end
