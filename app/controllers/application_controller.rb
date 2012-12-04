class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authorize_admin, :except => [:login,:reset_password,:check_mail,:enter_new_password]
  
  protected

	def authorize_prof
   user = User.find_by_id(session[:professor_id])
   unless user 
      session[:professor_id] = nil
      @url_filtered = url_for(params) 
      redirect_to login_url(:url => @url_filtered)
    end 
	end
	
	def authorize_alumni
	  user = User.find_by_id(session[:alumne_id])
	  unless user
	    session[:alumne_id] = nil
      @url_filtered = url_for(params) 
      redirect_to login_url(:url => @url_filtered)
    end
  end
end
