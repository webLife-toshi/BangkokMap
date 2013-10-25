class Administrator < ActiveRecord::Base
  #attr_accessible :admin_email, :admin_name, :password, :password_confirmation
  before_save :admin_encrypt_password

  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :admin_email
  validates_presence_of :admin_name
  validates_uniqueness_of :admin_email

  def admin_encrypt_password
    if password.present?
      self.admin_password_salt = BCrypt::Engine.generate_salt
      self.admin_password_hash = BCrypt::Engine.hash_secret(password, admin_password_salt)
    end
  end

  def self.authenticate(admin_email, password)
    user = find_by_admin_email(admin_email)
    if user && user.admin_password_hash == BCrypt::Engine.hash_secret(password, user.admin_password_salt)
      user
    else
      nil
    end
  end
end
