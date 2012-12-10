ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.endoreprocasos.net',
  :port => 587,
  :domain => 'endoreprocasos.net',
  :authentication => :plain,
  :user_name => 'noreply@endoreprocasos.net',
  :password => 'Hspcasos'
}

ActionMailer::Base.default_url_options[:host] = "endoreprocasos.net"