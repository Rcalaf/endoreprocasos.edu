# encoding: UTF-8
class Front::PagesController < Front::FrontController
  
  def index
     @title = "CURSO PRÁCTICO DE ENDOCRINOLOGÍA GINECOLÓGICA Y REPRODUCCIÓN HUMANA BASADO EN EL CASO"
  end
  
  def show
    @page = Page.find_by_slug(params[:slug])
    @title = @page.title
    @contents = @page.contents
  end
  
  def root
    @page = Page.find_by_home(true)
    @title = @settings.main_title
    @contents = @page.contents
    render :show
  end
  
  def contact
    @title = "Contacto"
    if request.post?
      unless params[:user][:email].empty? || params[:user][:mensaje].empty?
        Mailer.contact(params[:user]).deliver
        flash.now[:notice] = "Grácias por contactar con nosotros!"
      else
        flash.now[:error] = "Pon un mensaje y un email para enviar el formulario"
      end
    end
  end
end
