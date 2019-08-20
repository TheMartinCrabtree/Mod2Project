class AddPasswordDigestToDungeonmasters < ActiveRecord::Migration[5.2]
  def change
    add_column :dungeonmasters, :password_digest, :string
    add_column :dungeonmasters, :username, :string
  end
end
