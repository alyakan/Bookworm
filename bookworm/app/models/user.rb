class User < ActiveRecord::Base
	include BCrypt

	before_save :encrypt_password

	validates_confirmation_of :password , :message => "Passwords do not match."
	validates_presence_of :password, :message => "Please Enter a Password"
	validates_presence_of :email, :message=>"Email cannot be blank"
	validates_uniqueness_of :email, :message => "Sorry this Email is already registered."
	validates_presence_of :first_name, :message => "First Name Field cannot be blank"
	validates_presence_of :last_name, :message => "Last Name Field cannot be blank"

	after_create :message => "Thanks for using Bookworm!"


	# Function Responsible for authenticating users
	# Author: Aly Yakan
	def self.authenticate(email, password)
	    user = find_by_email(email)
	    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	      user
	    else
	      nil
	    end
	end


	# Function Responsible for encrypting user's password
	# Author: Aly Yakan
	def encrypt_password
	    if password.present?
	      self.password_salt = BCrypt::Engine.generate_salt
	      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	    end
	end

end
