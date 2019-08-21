class Encounter < ApplicationRecord
  belongs_to :dungeonmaster
  has_many :playerencounters 
  has_many :players, through: :playerencounters
  has_and_belongs_to_many :monsters


  # xp per CR = Monster Manual pg 10
  # player xp threshold = DMG pg 82
  
  def get_monster_list
    #temp monster count need to create column
    monster_count = 2
    if(monster_count > 0)
      xp_per_mob = calc_party_xp_threshold / monster_count
      xp_per_mob = xp_per_mob / monster_multiplier(monster_count)
      monster_cr = get_monster_cr(xp_per_mob)
      monster_list = Monster.find_by_cr(monster_cr)
      byebug
    end
  end

  def get_monster_cr(xp_per_mob)
    case xp_per_mob
      when 0..24                      then 0.0
      when 25..49                     then 0.125
      when 50..99                     then 0.250
      when 100..199                    then 0.500
      when 200..449                    then 1.0
      when 450..699                    then 2.0
      when 700..1099                    then 3.0
      when 1100..1799                   then 4.0
      when 1800..2299                   then 5.0
      when 2300..2899                   then 6.0
      when 2900..3899                   then 7.0
      when 3900..4999                   then 8.0
      when 5000..5899                   then 9.0
      when 5900..7199                   then 10.0
      when 7200..8399                   then 11.0
      when 8400..9999                   then 12.0
      when 10000..11499                  then 13.0
      when 11500..12999                 then 14.0
      when 13000..14999                 then 15.0
      when 15000..17999                 then 16.0
      when 18000..19999                 then 17.0
      when 20000..21999                 then 18.0
      when 22000..24999                 then 19.0
      when 25000..32999                 then 20.0
      when 33000..40999                 then 21.0
      when 41000..59999                 then 22.0
      when 50000..61999                 then 23.0
      when 62000..74999                 then 24.0
      when 75000                 then 25.0
      else  26.0
    end
  end


  def monster_multiplier(monster_count)

    case monster_count
      when 1                then 1.0
      when 2                then 1.5
      when 3..6             then 2.0
      when 7..10            then 2.5
      when 11..14           then 3.0
      when 15..100          then 4.0
    end

  end

  


  def calc_party_xp_threshold
    party_levels = self.players.pluck(:player_level)
    @party_xp_threshold = self.medium_cr_calculation(party_levels)
  end


  def hard_cr_calculation(party_levels)

  end


  def medium_cr_calculation(party_levels)
    
    @party_xp_total = 0
    party_levels.each do |level|
      case level
        when 1      then @party_xp_total+=50
        when 2      then @party_xp_total+=100
        when 3      then @party_xp_total+=150
        when 4      then @party_xp_total+=250
        when 5      then @party_xp_total+=500
        when 6      then @party_xp_total+=600
        when 7      then @party_xp_total+=750
        when 8      then @party_xp_total+=900
        when 9      then @party_xp_total+=1100
        when 10     then @party_xp_total+=1200
        when 11     then @party_xp_total+=1600
        when 12     then @party_xp_total+=1600
        when 13     then @party_xp_total+=1600
        when 14     then @party_xp_total+=1600
        when 15     then @party_xp_total+=1600
        when 16     then @party_xp_total+=1600
        when 17     then @party_xp_total+=1600
        when 18     then @party_xp_total+=1600
        when 19     then @party_xp_total+=1600
        when 20     then @party_xp_total+=1600
      end
    end

    return @party_xp_total
  end

  def easy_cr_calculation(party_levels)

  end



end
