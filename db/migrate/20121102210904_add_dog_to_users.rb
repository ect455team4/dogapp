class AddDogToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :dog_name, :string
    add_column :users, :dog_breed, :string
    add_column :users, :dog_dob, :string
    add_column :users, :vet, :string
    add_column :users, :boarder, :string
    add_column :users, :groomer, :string
    add_column :users, :food, :string
    add_column :users, :toys, :string
  end

  def self.down
    remove_column :users, :dog_name, :string
    remove_column :users, :dog_breed, :string
    remove_column :users, :dog_dob, :string
    remove_column :users, :vet, :string
    remove_column :users, :boarder, :string
    remove_column :users, :groomer, :string
    remove_column :users, :food, :string
    remove_column :users, :toys, :string
  end
end
