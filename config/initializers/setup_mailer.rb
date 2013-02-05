ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.endoreprocasos.es',
  #:address => 'ssl0.ovh.net',
  #:port => 587,
  :port => 465,
  :domain => 'endoreprocasos.es',
  #:authentication => :plain,
  :authentication => :login,
  :user_name => 'info%endoreprocasos.es',
  :password => 'DgQxXRna5z'
}

ActionMailer::Base.default_url_options[:host] = "endoreprocasos.es"