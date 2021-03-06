class EncountersController < ApplicationController
    before_action :find_encounter, only: [:show, :edit, :update, :destroy]


    def index 
        @encounters = Encounter.all
    end
    
    def new
        @encounter = Encounter.new()
        @players = Player.all()
        #DM is temp until we can pass ID on creation
        @dungeonmasters = Dungeonmaster.all()
    end

    def create
        if(!params[:encounter][:player_ids][1])
            flash[:error] = "No!"
            redirect_to new_encounter_path
        else
            @encounter = Encounter.create(encounter_params)
            if(@encounter.valid?)
                attach_players_to_encounter
                
                redirect_to edit_encounter_path(@encounter)
            else
                flash[:error]=@encounter.errors.full_messages
                redirect_to new_encounter_path
            end
        end


    end


    def update
        if(params[:monsters])
            params.permit(:monsters)
            params[:monsters].each do |mob_id|
                Encountermonster.create(encounter_id: @encounter.id, monster_id: mob_id)
            end
            
            redirect_to encounters_path
        else
            #flash[:error]=
            redirect_to edit_encounter_path(@encounter)
        end
    end

    def show

    end

    
    def edit
        @monster_list = @encounter.get_monster_list(@encounter.monster_quantity)
    end

    def destroy
        @encounter.destroy
        redirect_to encounters_path 
    end

    def fight
        find_encounter
    end


    private

    def find_encounter
        @encounter = Encounter.find(params[:id])
    end

    def encounter_params
        params.require(:encounter).permit(:dungeonmaster_id, :name, :monster_quantity, :terrain_type, :player_ids)
    end

    def attach_players_to_encounter
        params[:encounter][:player_ids].each do |char_id|
            if(char_id)
                Playerencounter.create(player_id: char_id, encounter_id: @encounter.id)
            end
        end
    end

end
