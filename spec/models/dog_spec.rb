# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  breed      :string(255)
#  dob        :date
#  dog_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Dog do
  pending "add some examples to (or delete) #{__FILE__}"
end
