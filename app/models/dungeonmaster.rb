class Dungeonmaster < ApplicationRecord
    has_many :players
    has_many :encounters
    has_many :encountermonsters, through: :encounters
    has_many :monsters, through: :encountermonsters
    has_secure_password
    validates :username, uniqueness: true
    
end
