# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  dob        :date
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  short_bio  :string(255)
#  long_bio   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Users do
  
	before(:each) do 
		@attr = { :first_name => "Example", :last_name => "User", :email => "Example@User.com", :dob => "8/6/1990", :address => "", :city => "Chicago", :state => "IL", :country => "USA", :short_bio => "This is the short bio section.", :long_bio => "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." }
	end

	it "should create a new instance given valid attributes" do
		User.create!(@attr)
	end

	it "should require a first name" do
		no_name_user = User.new(@attr.merge(:first_name => ""))
		no_name_user.should_not be_valid
	end

	it "should require a last name" do
		no_name_user = User.new(@attr.merge(:last_name => ""))
		no_name_user.should_not be_valid
	end

	it "should reject names that are too long" do
		long_name = "a" * 51
		long_name_user = User.new(@attr.merge(:first_name => long_name, :last_name => long_name))
		long_name_user.should_not be_valid
	end
end
