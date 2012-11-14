# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  breed      :string(255)
#  dob        :date
#  dog_id_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dog < ActiveRecord::Base
  attr_accessible :breed, :dob, :name, :dog_id
  	belongs_to :user

  	validates :user_id, :presence => true
  	validates :name, :presence => true, :length => { :maximum => 30 }
  	validates :breed, :presence => true, :length => { :maximum => 30 }

  	before_save :case_dogname, :case_dogbreed

  	default_scope order: 'dogs.dog_id ASC'

  	private

  	def case_dogname
      self.name = self.name.titlecase if self.name.present?
    end

    def case_dogbreed
      self.breed = self.breed.titlecase if self.breed.present?
    end
end
