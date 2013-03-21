# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.all.empty?
User.create(:email => "jcalaf@santpau.cat", :proxy_password => "24122412", :proxy_password_confirmation => "24122412", :email_confirmation => "jcalaf@santpau.cat", :name => "Joaquim", :last_name => "Calaf", :status => "professor")
User.create(:email => "jespinos@santpau.cat", :proxy_password => "24122412", :proxy_password_confirmation => "24122412", :email_confirmation => "jespinos@santpau.cat", :name => "Juanjo", :last_name => "Espinos", :status => "professor")
end

if Page.all.empty?
Page.create(:title => "root",:menu_title => "root", :home => true)
end

if Setting.all.empty?
  Setting.create(:main_title => 'CURSO PRÁCTICO DE ENDOCRINOLOGÍA GINECOLÓGICA Y REPRODUCCIÓN HUMANA BASADO EN EL CASO', :subtitle => 'Barcelona, December 12, 13, 14', :footer => 'Footer')
end