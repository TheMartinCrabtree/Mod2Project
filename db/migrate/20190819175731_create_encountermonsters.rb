class CreateEncountermonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :encountermonsters do |t|
      t.belongs_to :encounter, foreign_key: true
      t.belongs_to :monster, foreign_key: true

      t.timestamps
    end
  end
end
