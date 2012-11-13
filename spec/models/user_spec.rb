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
#  zip                :string(255)
#  short_bio          :string(255)
#  long_bio           :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#

require 'spec_helper'

describe User do
  

end
