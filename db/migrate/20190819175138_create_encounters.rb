class CreateEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :encounters do |t|
      t.belongs_to :dungeonmaster, foreign_key: true
      #t.belongs_to :player, foreign_key: true
      t.string :name
      t.integer :monster_quantity
      t.string :terrain_type

      t.timestamps
    end
  end
end
