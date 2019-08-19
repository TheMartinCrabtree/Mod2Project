require 'json'



class Monster < ApplicationRecord
    has_and_belongs_to_many :encounters
    #belongs_to :players, through: :encounters

    def self.get_data
        monsters_json = File.read('monsterdata.json')
        @monsters = JSON.parse(monsters_json)

    end
    
   

    def self.write_monster_to_database
        monsters = Monster.get_data
        
        monsters.each do |monster|
            
            Monster.create(
                monster_name: monster["name"],
                monster_type: monster["type"],
                monster_alignment: monster["alignment"],
                monster_size: monster["size"],
                armor_class: monster["armor_class"],
                hit_points: monster["hit_points"],
                challenge_rating: monster["challenge_rating"]
                )
        end
    end


end
