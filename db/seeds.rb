# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => "jcalaf@santpau.cat", :proxy_password => "2412", :proxy_password_confirmation => "2412", :email_confirmation => "jcalaf@santpau.cat", :name => "Joaquim", :last_name => "Calaf", :status => "professor")
User.create(:email => "jespinos@santpau.cat", :proxy_password => "2412", :proxy_password_confirmation => "2412", :email_confirmation => "jespinos@santpau.cat", :name => "Juanjo", :last_name => "Espinos", :status => "professor")