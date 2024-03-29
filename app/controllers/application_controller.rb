class ApplicationController < ActionController::Base
  protect_from_forgery
 # before_filter :authenticate
  before_filter :load_main_data
  
  def load_main_data
    @user = User.find_by_id(session[:user_id]) || User.find_by_token(params[:token])  
    @settings = Setting.first
  end
  

  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic("Debes autenticarte para entrar") do |username,password|
      username == "HSP" && password == "gine"
    end
  end
	
	def authorize
	  user = User.find_by_id(session[:user_id])
	  unless user
	    session[:user_id] = nil
      @url_filtered = url_for(params) 
      redirect_to root_url(:url => @url_filtered)
    end
  end
  
  def authorize_profile
    user = User.find_by_id(session[:user_id]) || User.find_by_token(params[:token])  
	  unless user
	    session[:user_id] = nil
      @url_filtered = url_for(params) 
      redirect_to root_url(:url => @url_filtered)
    else
      session[:user_id] = user.id
    end
  end
  
  def set_token(length)
	   chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
	   token = []
	   length.times{ token << chars[rand(62)] }
	   token.join("")
	end
end
