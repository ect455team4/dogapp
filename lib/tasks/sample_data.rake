#require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:first_name 			=> "Admin",
					 		 :last_name 			=> "User",
					 		 :email 				=> "Admin@admin.org",
					 		 :password				=> "password",
					 		 :password_confirmation => "password")
		admin.toggle!(:admin)
	end
end