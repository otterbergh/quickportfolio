class User < ActiveRecord::Base
  has_many :portfolios
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessor :login
  attr_accessible :login
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def email_required?
    false
  end

  validate :username_or_email_is_present

  def username_or_email_is_present
    if self.username.blank? && self.email.blank?
      errors.add(:base, "Email or Username must be set")
    end
  end
  
end
