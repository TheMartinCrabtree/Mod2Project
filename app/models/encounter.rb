class Encounter < ApplicationRecord
  belongs_to :dungeonmaster
  belongs_to :player
  has_and_belongs_to_many :monsters
end
