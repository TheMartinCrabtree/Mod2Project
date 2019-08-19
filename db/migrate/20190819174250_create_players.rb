class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :player_hp
      t.integer :player_level

      t.timestamps
    end
  end
end
