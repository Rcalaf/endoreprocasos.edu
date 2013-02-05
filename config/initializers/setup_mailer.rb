#ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  #:tls => true,
 #:enable_starttls_auto => true,
  :address => 'smtp.endoreprocasos.es',
  #:address => 'ssl0.ovh.net',
  #:port => 26,
  :port => 465,
  :domain => 'endoreprocasos.es',
  #:authentication => :plain,
   :authentication => :ntlm,
  :user_name => 'info@endoreprocasos.es',
  :password => 'HSP001'
}

ActionMailer::Base.default_url_options[:host] = "endoreprocasos.es"




=begin
Net::SMTP.start('smtp.endoreprocasos.es', 587, 'endoreprocasos.es','info@endoreprocasos.es', 'HSP001', :plain) do |smtp|
  smtp.send_message msgstr, 'info@endoreprocasos.es', 'rcalaf.cot@gmail.com'
end
=end