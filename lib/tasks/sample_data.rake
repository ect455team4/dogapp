require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
			make_users
			make_microposts
			make_relationships
		end
	end
	
	def make_users
		admin = User.create!(:first_name 			=> "Admin",
					 		 :last_name 			=> "User",
					 		 :email 				=> "admin@admin.org",
					 		 :password				=> "password",
					 		 :password_confirmation => "password")
		admin.toggle!(:admin)

		#Sample Users
		99.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "User-#{n+1}@example.com"
			password = "password"
			#Create Users
			User.create!(:first_name 			=> first_name,
						 :last_name 			=> last_name,
						 :email					=> email,
						 :password 				=> password,
						 :password_confirmation => password)
		end
	end
		
	def make_microposts
		#Sample User Microposts
		User.all(:limit => 6).each do |user|
			50.times do
				content = Faker::Lorem.sentence(5)
				user.microposts.create!(:content => content)
			end
		end
	end

	def make_relationships
  		users = User.all
  		user  = users.first
  		following = users[1..50]
  		followers = users[3..40]
  		following.each { |followed| user.follow!(followed) }
  		followers.each { |follower| follower.follow!(user) }
	end