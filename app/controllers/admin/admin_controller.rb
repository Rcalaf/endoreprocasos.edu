class Admin::AdminController < ApplicationController
    before_filter :authorize, :except => [:login,:reset_password,:check_mail,:enter_new_password]
end