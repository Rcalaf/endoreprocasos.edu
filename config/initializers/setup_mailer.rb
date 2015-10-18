ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.endoreprocasos.es',
  :port => 587,
  :domain => 'endoreprocasos.es',
  :authentication => :plain,
  :user_name => 'postmaster@endoreprocasos.es',
  :password => 'HSP001',
  :enable_starttls_auto => true,
  :openssl_verify_mode  => 'none'
}

ActionMailer::Base.default_url_options[:host] = "endoreprocasos.es"




=begin
Net::SMTP.start('smtp.endoreprocasos.es', 587, 'endoreprocasos.es','info@endoreprocasos.es', 'HSP001', :plain) do |smtp|
  smtp.send_message msgstr, 'info@endoreprocasos.es', 'rcalaf.cot@gmail.com'
end
=end