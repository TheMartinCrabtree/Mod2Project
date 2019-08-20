class LoginController < ApplicationController

    def new
    end

    def create
        @dungeonmaster = Dungeonmaster.find_by(username: params[:username])
        if @dungeonmaster && @dungeonmaster.authenticate(params[:password])
            redirect_to monsters_path 
        else
            flash[:message] = "incorrect username and/or password."
            redirect_to '/welcome'
        end
    end


end
