class EncountersController < ApplicationController
    
    def index 
        @encounters = Encounter.all
    end

    def new
        @encounter = Encounter.new
    end



end
