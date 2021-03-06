require 'json'


class Monster < ApplicationRecord
    has_many :encountermonsters
    has_many :encounters, through: :encountermonsters
    #has_and_belongs_to_many :encounters

    

    def self.find_by_cr(cr_var)
        self.where(["challenge_rating = ?", cr_var])
    end
    
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


    def monster_params
        params.require(:monster).permit(:monster_name, :id)
    end
end
