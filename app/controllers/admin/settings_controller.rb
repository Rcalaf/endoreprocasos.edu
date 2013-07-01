# encoding: UTF-8
class Admin::SettingsController < Admin::AdminController

  def edit
    @title = "Endoreprocasos | Editar configuración"
    @settings = Setting.first
    if request.put?
      flash[:settings] = "Configuración actualizada" if @settings.update_attributes(params[:setting])
    end
  end
  
  def delete_footer_logo
    @settings = Setting.first
    @settings.footer_logo = nil
    @settings.save
    redirect_to edit_settings_url
  end
  
end
