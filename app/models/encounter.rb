class Encounter < ApplicationRecord
  belongs_to :dungeonmaster
  has_many :playerencounters 
  has_many :players, through: :playerencounters
  has_and_belongs_to_many :monsters

  def calc_party_xp_threshold #(players_hash)
    # players_hash = {[:name]=""}
    
    
    
  end

  def hard_cr_calculation(party_threshold)

  end

  def medium_cr_calculation(party_threshold)

  end

  def easy_cr_calculation(party_threshold)

  end



end
