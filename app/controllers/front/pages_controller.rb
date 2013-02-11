# encoding: UTF-8
class Front::PagesController < Front::FrontController
  layout 'roger'
  
  def index
     @title = "CURSO PRÁCTICO DE ENDOCRINOLOGÍA GINECOLÓGICA Y REPRODUCCIÓN HUMANA BASADO EN EL CASO"
  end
end
