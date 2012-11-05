require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:first_name 			=> "Admin",
					 		 :last_name 			=> "User",
					 		 :email 				=> "admin@admin.org",
					 		 :password				=> "password",
					 		 :password_confirmation => "password")
		admin.toggle!(:admin)

		#Sample Users
		20.times do |n|
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
		
		#Sample User Microposts
		User.all(:limit => 6).each do |user|
			50.times do
				user.microposts.create!(:content => Faker::Lorem.sentence(5))
			end
		end
	end
end
end