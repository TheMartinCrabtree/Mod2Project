class CreatePlayerencounters < ActiveRecord::Migration[5.2]
  def change
    create_table :playerencounters do |t|
      t.string :name
      t.belongs_to :player, foreign_key: true
      t.belongs_to :encounter, foreign_key: true

      t.timestamps
    end
  end
end
