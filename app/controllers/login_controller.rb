class LoginController < ApplicationController

    def new
        #gets our form
    end

    def create
        @dungeonmaster = Dungeonmaster.find_by(username: params[:username])
        if @dungeonmaster && @dungeonmaster.authenticate(params[:password])
            redirect_to monsters_path #just a test route for now, should actually take to DM index
        else
            flash[:message] = "incorrect username and/or password."
            redirect_to '/welcome'
        end
    end


end
