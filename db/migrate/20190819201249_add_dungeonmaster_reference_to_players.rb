class AddDungeonmasterReferenceToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :dungeonmaster, foreign_key: true
  end
end
