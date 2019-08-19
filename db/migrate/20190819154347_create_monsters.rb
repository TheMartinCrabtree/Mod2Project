class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :monster_name
      t.string :monster_type
      t.string :monster_size
      t.string :monster_alignment
      t.integer :armor_class
      t.integer :hit_points
      t.float :challenge_rating

      t.timestamps
    end
  end
end
