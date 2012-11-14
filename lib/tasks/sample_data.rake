require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
			make_admin
		end
	end
	
	def make_admin
		admin = User.create!(:first_name 			=> "Admin",
					 		 :last_name 			=> "User",
					 		 :email 				=> "admin@admin.org",
					 		 :zip 					=> "60614",
					 		 :password				=> "password",
					 		 :password_confirmation => "password")
		admin.toggle!(:admin)

	end
	def make_users
		20.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "User-#{n+1}@example.com"
			dob = "2012/11/14"
			address = Faker::Address.street_name
			zip = Faker::Address.zip_code
			short_bio = Faker::Lorem.sentence(2)
			long_bio = Faker::Lorem.sentence(6)
			password = "password"
			#Create Users
			User.create!(:first_name 			=> first_name,
						 :last_name 			=> last_name,
						 :email					=> email,
						 :dob 					=> dob,
						 :address   			=> address,
						 :zip 					=> zip,
						 :short_bio				=> short_bio,
						 :long_bio				=> long_bio,
						 :password 				=> password,
						 :password_confirmation => password)
		end
	end

	def make_dogs
		
		name = Faker::Name.first_name
		users[1..4] = user.dogs.create!(:name => name, :breed => "German Sheppard", :dob => "2012/11/14")

		name = Faker::Name.first_name
		users[4..8] = user.dogs.create!(:name => name, :breed => "Black Lab", :dob => "2012/6/14")
		
		name = Faker::Name.first_name
		users[9..11] = user.dogs.create!(:name => name, :breed => "Poodle", :dob => "2012/9/21")
		
		name = Faker::Name.first_name
		users[12..13] = user.dogs.create!(:name => name, :breed => "Beagle", :dob => "2012/3/29")

		name = Faker::Name.first_name
		users[14..15] = user.dogs.create!(:name => name, :breed => "Chihuahua", :dob => "2011/5/6")
	end

		
	def make_microposts
		#Sample User Microposts
		User.all(:limit => 99).each do |user|
			50.times do
				content = Faker::Lorem.sentence(3)
				user.microposts.create!(:content => content)
			end
		end
	end

	def make_relationships
  		users = User.all
  		user  = users.first
  		following = users[1..8]
  		followers = users[9..15]
  		following.each { |followed| user.follow!(followed) }
  		followers.each { |follower| follower.follow!(user) }
	end