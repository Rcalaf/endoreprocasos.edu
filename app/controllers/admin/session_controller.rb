# encoding: UTF-8
class Admin::SessionController < ApplicationController
  def login
     if user = User.find_by_id(session[:admin_id])
       redirect_to pages_path
     else
       @title = "Hola, identifícate por favor"
      if request.post?
         data = User.authenticate(params[:email],params[:proxy_password])
         user = data[:user]
         if user
            if user.status == "professor" 
              session[:professor_id] = user.id
              session[:alumne_id] = user.id
            else user.status == "alumne" 
              session[:alumne_id] = user.id
            end
              redirect_to params[:url].nil? || params[:url] == "" ? pages_url : params[:url]
         else
           flash.now[:notice] = data[:flash]
         end
       end
     end
   end 
  
  
  def logut 
    session[:professor_id] = nil
    session[:alumne_id] = nil
  end
end
