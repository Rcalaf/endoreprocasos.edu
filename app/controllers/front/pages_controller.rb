# encoding: UTF-8
class Front::PagesController < Front::FrontController
  
  def index
     @title = @settings.main_title
     @description = ""
  end
  
  def show
    @page = Page.find_by_slug(params[:slug])
    @title = @page.title
    @description = @page.description
    @contents = @page.contents
  end
  
  def root
    @page = Page.find_by_home(true)
    @title = @settings.main_title
    @description = @settings.main_description
    @contents = @page.contents
    render :show
  end
  
  def teachers
    @title = "Profesores"
    @description = @settings.main_description
    @teachers = User.professors.order('last_name asc')
  end
  
  def contact
    @title = "Contacto"
    @description = "En esta página podreis encontrar toda la información necesaria para contactar con nosotros así como un formulario de consulta."
    if request.post?
      @consulta = Consulta.create(params[:consulta])
      if @consulta.valid?
        Mailer.contact(@consulta).deliver
        flash.now[:notice] = "Grácias por contactar con nosotros!"
      else
        flash.now[:error] = "Pon un mensaje y un email para enviar el formulario"
      end
    else
      @consulta = Consulta.new
    end
  end
end
