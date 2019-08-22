class DungeonmastersController < ApplicationController


    def index
        @encounters = Encounter.all
        @dungeonmasters = Dungeonmaster.all
        #need to somehow have this associated with the instance of dm we're signed in as
    end
    
    def new
        @dungeonmaster = Dungeonmaster.new
    end

    def create
        @dungeonmaster = Dungeonmaster.create(dm_params)
        if @dungeonmaster.valid?
            flash[:message] = "Created #{@dungeonmaster.name}."
            redirect_to @dungeonmaster
        else 
            flash[:message] = "Ya dun goofed."
            redirect_to "/welcome"
        end
    end

    private

    def dm_params
        params.require(:dungeonmaster).permit(:name, :username, :password)
    end

end
