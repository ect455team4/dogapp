class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :email
      t.date      :dob
      t.string    :address
      t.string    :city
      t.string    :state
      t.string    :country
      t.string    :short_bio
      t.text      :long_bio

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
