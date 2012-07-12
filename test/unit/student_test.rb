# == Schema Information
#
# Table name: students
#
#  created_at      :datetime         not null
#  first_name      :string(255)
#  full_name       :string(255)
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  nickname        :string(255)
#  organization_id :integer
#  updated_at      :datetime         not null
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
