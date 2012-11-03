# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  dob                :date
#  address            :string(255)
#  city               :string(255)
#  state              :string(255)
#  country            :string(255)
#  short_bio          :string(255)
#  long_bio           :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#  dog_name           :string(255)
#  dog_breed          :string(255)
#  dog_dob            :string(255)
#  vet                :string(255)
#  boarder            :string(255)
#  groomer            :string(255)
#  food               :string(255)
#  toys               :string(255)
#

require 'spec_helper'

describe User do
  

end
