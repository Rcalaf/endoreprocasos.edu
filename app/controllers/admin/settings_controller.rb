# encoding: UTF-8
class Admin::SettingsController < ApplicationController
  layout 'admin'
  def edit
    @settings = Setting.first
    if request.put?
      flash[:settings] = "Configuración actualizada" if @settings.update_attributes(params[:setting])
    end
  end
  
end
