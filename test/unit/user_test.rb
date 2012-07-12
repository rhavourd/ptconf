# == Schema Information
#
# Table name: users
#
#  created_at      :datetime         not null
#  email           :string(255)
#  first_name      :string(255)
#  full_name       :string(255)
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  password_digest :string(255)
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
