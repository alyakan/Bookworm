class User < ActiveRecord::Base
	include BCrypt
  	attr_accessor :password
  	
	before_save :encrypt_password

	validates_confirmation_of :password , :message => "Passwords do not match."
	validates_presence_of :password, :message => "Please Enter a Password"
	validates_presence_of :email, :message=>"Email cannot be blank"
	validates :email, email_format: { message: "Doesn't look like an email address" }
	validates_uniqueness_of :email, :message => "Sorry this Email is already registered."
	validates_presence_of :first_name, :message => "First Name Field cannot be blank"
	validates_presence_of :last_name, :message => "Last Name Field cannot be blank"
	
  	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  	:default_url => "/images/:style/missing.png"
	validates_attachment :avatar,
	:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"],
	:message=> "Invalid image format" }

	after_create :message => "Thanks for using Bookworm!"


	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :review_comments, dependent: :destroy



	validate :that_date_of_birth_is_not_in_the_future
	def that_date_of_birth_is_not_in_the_future 
		self.errors.add :date_of_birth, 'is in the future' \
			unless self.date_of_birth <= Date.today 
	end

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
