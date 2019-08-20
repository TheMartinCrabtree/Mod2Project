class DungeonmastersController < ApplicationController

    def index
        @dungeonmasters = Dungeonmaster.all
    end
    
    def new
        @dungeonmaster = Dungeonmaster.new
    end

    def create
        @dungeonmaster = Dungeonmaster.create(dm_params)
        if @dungeonmaster.valid?
            flash[:message] = "Created #{@dungeonmaster.name}."
            redirect to @dungeonmaster
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
