class LoginController < ApplicationController

    def index

    end

    def new
        @dungeonmaster = Dungeonmaster.new
        # redirect_to @dungeonmaster
    end

    def create
        @dungeonmaster = Dungeonmaster.find_by(name: params[:name])
        if @dungeonmaster && @dungeonmaster.authenticate(params[:password])
            session["dungeonmaster_id"] = @dungeonmaster.id 
            redirect_to monsters_path #just a test route for now, should actually take to DM index
        else
            flash[:message] = "incorrect username and/or password."
            redirect_to '/welcome'
        end
    end


end
