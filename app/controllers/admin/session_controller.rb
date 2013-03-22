# encoding: UTF-8
class Admin::SessionController < Admin::AdminController

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
              session[:alumne_id] = nil
              session[:professor_id] = user.id
            else user.status == "alumne" 
              session[:professor_id] = nil
              session[:alumne_id] = user.id
            end
            redirect_to params[:url].nil? || params[:url] == "" ? casos_url : params[:url] 
         else
             flash[:login] = data[:flash]
             redirect_to root_url
         end
       end
     end
   end 
  
   def reset_password
     @title = "Restablecer contraseña"
     @token = set_token(71) 
     respond_to do |format|
       format.js { render :layout=>false }
       #format.html 
     end
   end

   def check_mail
      @title = "Comprueba tu correo"
      user = User.find_by_email(params[:email])
      if user 
        if user.update_attribute("token",params[:token])
          Mailer.new_password_mail(user).deliver
        end
      end
      respond_to do |format|
         format.js { render :layout=>false }
         #format.html 
      end
   end

   def enter_new_password
     @title = "Entra tu nueva contraseña"
     @user = User.find_by_token(params[:token])
      raise ActiveRecord::RecordNotFound if !params[:token] || params[:token] == "" || @user.nil?
      if request.put? 
        params[:user][:token] = nil
        if @user.update_attributes(params[:user])
          redirect_to root_url        
        end
      end
   end
  
  def logout 
    session[:professor_id] = nil
    session[:alumne_id] = nil
    redirect_to root_url
  end
end
