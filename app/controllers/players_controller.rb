class PlayersController < ApplicationController

    before_action :find_player, only: [:show, :edit, :update]

    def index
        @players = @current_dm.players
    end
    
    def new
        @player = Player.new
    end
    
    def show
    end
    
    def create
        @player = Player.new(player_params)
        @player.dungeonmaster_id = session["dungeonmaster_id"]
        @player.save
        redirect_to @player
    end

    
    def edit 
    end
    
    def update
        @player.update(player_params)
        redirect_to players_path
    end
    
    def destroy
        @player.destroy
        redirect_to players_path
    end



    private

    def find_player
        @player = Player.find(params[:id])
    end

    def player_params
        params.require(:player).permit(:name, :player_hp, :player_level, :dungeonmaster_id)
    end


end
