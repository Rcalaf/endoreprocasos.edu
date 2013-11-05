# encoding: UTF-8
class Admin::UsersController < Admin::AdminController
  before_filter :authorize_profile, :only =>[:edit_user]
 
  def index
    @title = "Endoreprocasos | Usuarios"
    @professors = User.professors.order('last_name asc')
    @alumnes = User.alumnes.order('last_name asc')
  end

  def new
   @title = "Endoreprocasos | Nuevo usuario"
   @new_user = User.new
    if request.post?
      if params[:user][:status] == "alumne"
        pass = SecureRandom.hex(4)
        params[:user][:proxy_password] = params[:user][:proxy_password_confirmation] = pass
        params[:user][:token] = SecureRandom.hex(35)
      end
      @new_user = User.create(params[:user])
      if @new_user.valid? 
        Mailer.new_user_mail(@new_user).deliver if @new_user.status == "alumne"
         flash[:user] = "El usuario se ha creado correctamente"
        redirect_to users_url
      end
    end
  end

  def edit_user
    @new_user = User.find(params[:user_id])
    @title = "Endoreprocasos | Editar usuario #{@new_user.name} #{@new_user.last_name}"
    if request.put?
      (flash[:user] = "Los cambios se han guardado") if @new_user.update_attributes(params[:user])
    end
  end

  def delete
    user = User.find(params[:user_id])
    if user.destroy
       flash[:user] = "El usuario se ha eliminado correctamente"
      redirect_to users_url
    end
  end

end
