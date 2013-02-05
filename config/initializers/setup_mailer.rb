ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'mail.endoreprocasos.es',
  :port => 587,
  #:port => 26,
  :domain => 'endoreprocasos.es',
  :authentication => :plain,
  #:authentication => :login,
  :user_name => 'info@endoreprocasos.es',
  :password => 'DgQxXRna5z'
}

ActionMailer::Base.default_url_options[:host] = "endoreprocasos.es"