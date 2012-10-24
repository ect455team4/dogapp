# Migration for enforcing email uniqueness
# add_index method adds an index on the email column of the users table
# the index by itself doesnt enforce uniqueness, but the option ':unique => true' does

class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
  	add_index :users, :email, :unique => true 
  end

  def self.down
  	remove_index :users, :email
  end
end
