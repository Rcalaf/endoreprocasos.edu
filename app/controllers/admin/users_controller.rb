# encoding: UTF-8
class Admin::UsersController < Admin::AdminController
  layout 'roger'
 
  def index
    @professors = User.professors
    @alumnes = User.alumnes
  end

  def new
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
        redirect_to users_url
      else
        flash[:errors] = @new_user.errors
      end
    end
  end

  def edit
    @new_user = User.find(params[:user_id])
    if request.put?
      @new_user.update_attributes(params[:user])
    end
  end

  def delete
    user = User.find(params[:user_id])
    if user.destroy
      redirect_to users_url
    end
  end

end
