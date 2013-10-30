require 'bcrypt'

class User
	include Mongoid::Document

	attr_accessor :password, :password_confirmation


  field :username, type: String
	field :email, type: String
	field :salt, type: String
	field :hashed_password, type: String
  field :is_admin, type: Boolean, default: false




  has_and_belongs_to_many :uevents, class_name:"Event", 
    inverse_of: :eusers




  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  before_save :hash_password

  def authenticate(password)
    self.hashed_password ==
    BCrypt::Engine.hash_secret(password, self.salt)
  end

  private
  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password =
      BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end
end