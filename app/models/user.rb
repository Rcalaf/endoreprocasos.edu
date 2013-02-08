# encoding: UTF-8
class User < ActiveRecord::Base
  attr_accessible :email, :failed_login_attempts, :login_blocked_until, :password, :salt, :token, :token_valid_until, :proxy_password, :proxy_password_confirmation, :email_confirmation, :name, :last_name, :status

  before_validation :downcase_email

  validates :email, :presence => {:presence => true,:message => "Escribe un email", :if => :enable_email_validations}
  validates :email, :uniqueness => {:uniqueness => true,:message => "Ya existe un usuario con este email",:if => :enable_email_validations}
  validates :email, :format => {:with => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,:message => "El email no tiene el formato correcto", :if => :enable_email_validations }
  validates :email, :confirmation => {:confirmation => true,:message => "Los emails no coinciden", :if => :enable_email_validations }
  validates :email_confirmation, :presence => {:presence => true, :message => "Confirma el email",:if => :enable_email_validations }
  validates :status, :presence => {:presence => true,:message => "Elige un tipo de usuario"}

  validates :proxy_password, :presence => {:presence => true,:message => "Escribe una contraseña", :if => :enable_password_validations}
  validates :proxy_password, :length => { :in => 8..60,:message => "La contraseña debe tener 8 caracteres mínimo", :if => :enable_password_validations }
  #validates :proxy_password, :format => {:with =>  /([a-z]+[A-Z]+[0-9]+|[A-Z]+[a-z]+[0-9]+|[A-Z]+[0-9]+[a-z]+|[0-9]+[a-z]+[A-Z]+|[a-z]+[0-9]+[A-Z]+|[0-9]+[A-Z]+[a-z]+)/,:message => "La contraseña debe tener mínimo una mayúscula, una minúscula y un número", :if => :enable_password_validations }
  validates :proxy_password, :confirmation => {:confirmation => true,:message => "Las contraseñas no coinciden", :if => :enable_password_validations }
  validates :proxy_password_confirmation, :presence => {:presence => true,:message => "Debes confirmar la contraseña", :if => :enable_password_validations }

  validates_uniqueness_of :token, :message => "", :if => :enable_token_validation

  attr_accessor :proxy_password_confirmation, :email_confirmation

  def proxy_password
    @proxy_password
  end

  def proxy_password=(pwd)
    @proxy_password = pwd
    return if pwd.blank?
    create_new_salt
    self.password = User.encrypted_password(self.proxy_password, self.salt)
  end

  scope :with_failed_attempts, where("failed_login_attempts > 0")
  scope :professors, where(:status => 'professor')
  scope :alumnes, where(:status => 'alumne')


  def self.authenticate(email,password)
    user = User.find_by_email(email.downcase)
    if user
      if user.check_if_blocked
        flash = "demasiados intentos:  usuario bloqueado #{(user.login_blocked_until - Time.now.to_i).strftime("%M:%S")} minutos"
        user = nil  
      else
        expected_password = encrypted_password(password,user.salt)
        if user.password != expected_password
          flash = user.add_miss_login_attempt
          user = nil
        end
      end
    else
      flash = "email o contraseña desconocidos"
    end
    data = {:user => user, :flash => flash}
  end

  def block_user_temporarly(time)
    if self.update_attribute(:failed_login_attempts,0)
      if self.update_attribute(:login_blocked_until,Time.now+(time*60))
        "demasiados intentos: usuario bloqueado #{time} minutos"
      end
    end 
  end

  def add_miss_login_attempt
    if self.failed_login_attempts.nil? || self.failed_login_attempts == 0
      if self.update_attribute(:failed_login_attempts,1)
        flash = "email o contraseña desconocidos"
      end
    else
      if self.failed_login_attempts + 1 == 5
      flash = self.block_user_temporarly(5)
      else  
        if self.update_attribute(:failed_login_attempts,self.failed_login_attempts + 1)
          flash = "email o contraseña desconocidos"
        end
      end
    end
    return flash
  end

  def check_if_blocked
    (self.login_blocked_until && self.login_blocked_until > Time.now) ? true : false
  end

  private  


   def downcase_email
     self.email = self.email.downcase
   end

   def self.encrypted_password(proxy_password,salt)
     string_to_hash = proxy_password + "patatot" + salt
     Digest::SHA1.hexdigest(string_to_hash)
   end

   def create_new_salt
     self.salt = self.object_id.to_s + rand.to_s
   end

   def enable_password_validations
     self.password_changed? || self.password.nil? || (self.proxy_password_confirmation && !self.proxy_password_confirmation.empty?)
   end

   def enable_email_validations
       self.email_changed? || (email_confirmation && !self.email_confirmation.empty?)
   end

   def enable_token_validation
     self.token
   end

end
