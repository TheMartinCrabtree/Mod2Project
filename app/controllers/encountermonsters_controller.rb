class EncountermonstersController < ApplicationController

    

    def destroy
        byebug

        find_encountermonster()
        find_encounter()
        # @encountermonster.delete()
        redirect_to @encounter
    end
    
    
      private
    
    def find_encountermonster
        @encountermonster = Encountermonster.find(params[:id])
    end

    def find_encounter
        @encounter = Encounter.find(params[:id])
    end

end
