class CreateDogs < ActiveRecord::Migration
  def self.up
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :dob
      t.references :dog
      t.integer :user_id

      t.timestamps
    end
    add_index :dogs, [:user_id]
  end
  def self.down
    drop_table :dogs
  end
end
