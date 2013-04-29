# encoding: UTF-8
class Admin::AdminController < ApplicationController
    layout 'admin'
    before_filter :authorize, :except => [:login,:reset_password,:check_mail,:enter_new_password]

    before_filter :admin_pages

    def admin_pages
      @admin_pages = Page.admin.order 'position asc'
    end
end