# encoding: UTF-8
class Admin::UsersController < Admin::AdminController
  before_filter :authorize_profile, :only =>[:edit_user]
 
  def index
    @title = "Endoreprocasos | Usuarios"
    @professors = User.professors.year_filter(params[:teacher_year].nil? ? Time.now.year : params[:teacher_year]).order('last_name asc')
    @alumnes = User.alumnes.year_filter(params[:alumni_year].nil? ? Time.now.year : params[:alumni_year]).order('last_name asc')
    @administradores = User.admin.order('last_name asc')
  end
  
  def alumnies
    @title = "Endoreprocasos | Alumnos"
    if @user.status == 'admin' || @user.status == 'professor'
      @alumnes = User.alumnes.year_filter(params[:year].nil? ? Time.now.year : params[:year]).order('last_name asc')
    else
      @alumnes = User.alumnes.year_filter(@user.promocion).order('last_name asc')
    end 
  end
  
  def profesores
    @title = "Endoreprocasos | Profesores"
    if @user.status == 'admin' || @user.status == 'professor'
      @professors = User.professors.year_filter(params[:year].nil? ? Time.now.year : params[:year]).order('last_name asc')
    else
      @professors = User.professors.year_filter(@user.promocion).order('last_name asc')
    end
  end

  def new
   @title = "Endoreprocasos | Nuevo usuario"
   @new_user = User.new
    if request.post?
      unless params[:user][:status] == "admin"
        pass = SecureRandom.hex(4)
        params[:user][:proxy_password] = params[:user][:proxy_password_confirmation] = pass
        params[:user][:token] = SecureRandom.hex(35)
      end
      @new_user = User.create(params[:user])
      if @new_user.valid? 
        Mailer.new_user_mail(@new_user).deliver unless @new_user.status == "admin"
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
    if @new_user.status == 'professor'
      @owner = @new_user
      @contents = @owner.contents
      @content = Content.new(:user_id => @owner.id)
    end

  end
  
  def move
   sort_array = params[:sort_data].split("&")
   sort_array.each_with_index do |content_id,position|
     content_id = content_id.split("=")[1].to_i 
     #if Content.update_all(['position=?',position + 1],['id=?',content_id])
    #   flash[:content] = "El orden se ha actualizado"
    # end 
   end
   respond_to do |format|
      format.js { render :layout=>false }
      #format.html 
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
