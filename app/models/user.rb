# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  dob                :date
#  address            :string(255)
#  zip                :string(255)
#  short_bio          :string(255)
#  long_bio           :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#

require 'digest'
class User < ActiveRecord::Base
  
  attr_accessor :password

  attr_accessible :address, :dob, :email, :first_name, :last_name, :long_bio, :short_bio, :password, :password_confirmation, :zip

  has_many :microposts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed

  has_many :reverse_relationships,  :foreign_key => "followed_id",
                                    :class_name => "Relationship",
                                    :dependent => :destroy

  has_many :followers, :through => :reverse_relationships, :source => :follower

  has_many :dogs, :dependent => :destroy

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  zip_regex = /^\d{5}(-\d{4})?$/

  validates :first_name, :presence => true, :length => { :maximum => 30 }
  validates :last_name, :presence	=> true, :length => { :maximum => 30 }
  validates	:email, :presence	=> true, :format => { :with => email_regex }, :uniqueness	=> { :case_sensitive => false }

  # creates the virtual attribute  'password_confirmation'.
  validates :password, :presence => true, :confirmation	=> true, :length	=> { :within => 6..40 }, :on => :update

  validates_format_of :zip, :with => zip_regex, :on => :update

  before_save :encrypt_password, :downcase_email, :case_firstname, :case_lastname, :full_name

  def full_name
    [first_name, last_name].join(' ')
  end

  #return true if the user password matches submitted password
  #compares encrypted_password with the encrypted version of submitted_password
  def has_password?(submitted_password)
  	encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
  	user = find_by_email(email)
  	return nil if user.nil?
  	return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private

  	def encrypt_password
  		self.salt = make_salt if new_record?
  		self.encrypted_password = encrypt(password)
  	end

  	def encrypt(string)
  		secure_hash("#{salt}--#{string}")
  	end

  	def make_salt
  		secure_hash("#{Time.now.utc}--#{password}")
  	end

  	def secure_hash(string)
  		Digest::SHA2.hexdigest(string)
  	end

    def downcase_email
      self.email = self.email.downcase if self.email.present?
    end

    def case_firstname
      self.first_name = self.first_name.capitalize if self.first_name.present?
    end

    def case_lastname
      self.last_name = self.last_name.capitalize if self.last_name.present?
    end

end
