# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  dob        :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  short_bio  :string(255)
#  long_bio   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  
  attr_accessor :password

  attr_accessible :address, :city, :country, :dob, :email, :first_name, :last_name, :long_bio, :short_bio, :state, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, 	:presence				=> true,
  							:length					=> { :maximum => 50 }
  
  validates :last_name,		:presence				=> true,
   							:length					=> { :maximum => 50 }
  
  validates	:email,			:presence				=> true,
  							:format					=> { :with => email_regex },
  							:uniqueness				=> { :case_sensitive => false }

# creates the virtual attribute  'password_confirmation'.
  validates :password,		:presence 				=> true,	
  							:confirmation			=> true,
  							:length					=> { :within => 6..40 }

  before_save :encrypt_password

#return true if the user password matches submitted password
  def has_password?(submitted_password)
  	#compares encrypted_password with the encrypted version of submitted_password
  end

  private

  	def encrypt_password
  		self.encrypted_password = encrypt(password)
  	end

  	def encrypt(string)
  		string #ONLY TEMPORARY
  	end
end
