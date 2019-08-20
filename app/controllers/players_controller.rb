class PlayersController < ApplicationController

    before_action :find_player, only: [:show, :edit, :update]

    def index
        @players = Player.all
    end
    
    def new
        @player = Player.new
    end

    def show
    end
    
    def create
        @player = Player.create(player_params)
        redirect_to players_path
    end

    
    def edit 
    end
    
    def update
        @player.update(player_params)
        redirect_to players_path
    end
    
    def destroy
    end

    private

    def find_player
        @player = Player.find(params[:id])
    end

    def player_params
        params.require(:player).permit(:name, :player_hp, :player_level)
    end


end
