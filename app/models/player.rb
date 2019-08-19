class Player < ApplicationRecord
    belongs_to :dungeonmaster
    has_many :encounters
    has_many :encountermonsters, through: :encounters
    has_many :monsters, through: :encountermonsters
end
