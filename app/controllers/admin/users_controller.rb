# encoding: UTF-8
class Admin::UsersController < Admin::AdminController
  layout 'roger'
 
  def index
    @professors = User.professors
    @alumnes = User.alumnes
  end

  def new
    @user = User.new
    if request.post?
      @user = User.create(params[:user])
      if @user.valid? 
        redirect_to users_url
      end
      puts @user.errors.messages
    end
  end

  def edit
    @user = User.find(params[:user_id])
    if request.put?
      @user.update_attributes(params[:user])
    end
  end

  def delete
    user = User.find(params[:user_id])
    if user.destroy
      redirect_to users_url
    end
  end

end
