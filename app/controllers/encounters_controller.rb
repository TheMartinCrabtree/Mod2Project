class EncountersController < ApplicationController
    before_action :find_encounter, only: [:show, :edit, :update, :destroy]

    def new
        @encounter = Encounter.new()
    end

    
    def create
        @encounter = Encounter.create(encounter_params)
        if(@encounter.valid?)
            redirect_to edit_encounter_path
        else
            flash[:error]=@encounter.errors.full_messages
            redirect_to new_encounter_path
        end

    end


    def update

    end

    
    def edit

    end



private

def find_encounter
    @encounter = Encounter.find[params[:id]]
end

def encounter_params
    params.require(:encounter).permit(:dungeonmaster_id, :name, :monster_quantity, :terrain_type)
end


end
