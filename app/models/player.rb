class Player < ApplicationRecord
    belongs_to :dungeonmaster
    has_many :playerencounters
    has_many :encounters, through: :playerencounters
    has_many :encountermonsters, through: :encounters
    has_many :monsters, through: :encountermonsters
end
