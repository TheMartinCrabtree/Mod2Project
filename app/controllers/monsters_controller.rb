class MonstersController < ApplicationController

    def index
        @players = Player.all
        @encounters = Encounter.all
        @monsters = Monster.all
    end

    def show
        @monster= Monster.find(params[:id])
    end

    
end
