class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  before_filter :get_user
  
  def get_user
    if session[:alumne_id]
      @user = User.find(session[:alumne_id])
    elsif session[:professor_id]
      @user = User.find(session[:professor_id])
    end
  end
  
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic("Debes autenticarte para entrar") do |username,password|
      username == "HSP" && password == "gine"
    end
  end
	
	def authorize
	  user_id = session[:professor_id] || session[:alumne_id]
	  user = User.find_by_id(user_id)
	  unless user
	    session[:professor_id] = nil
	    session[:alumne_id] = nil
      @url_filtered = url_for(params) 
      redirect_to login_url(:url => @url_filtered)
    end
  end
  
  def set_token(length)
	   chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
	   token = []
	   length.times{ token << chars[rand(62)] }
	   token.join("")
	end
end
