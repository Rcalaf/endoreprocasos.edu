ActionMailer::Base.smtp_settings = {
  #:enable_starttls_auto => true,
  :address => 'mail.endoreprocasos.es',
  #:port => 587,
  :port => 25,
  :domain => 'endoreprocasos.es',
#  :authentication => :plain,
  :authentication => :ntlm,
  :user_name => 'info@endoreprocasos.es',
  :password => 'DgQxXRna5z'
}

ActionMailer::Base.default_url_options[:host] = "endoreprocasos.es"