class ApplicationController < ActionController::Base
    before_action :set_up_auth_variables
    def set_up_auth_variables

     @dungeonmaster_id = session["dungeonmaster_id"]
     @logged_in = !!@dungeonmaster_id
      if @logged_in
      @current_dm = Dungeonmaster.find_by("dungeonmaster_id")
      
      end

    end

   def authorized
    unless @logged_in
      return redirect_to '/'
    end
   end

   def logout
    session["dungeonmaster_id"] = nil
   end

end
