# == Schema Information
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  code        :string(255)
#  description :string(255)
#  first_day   :date
#  last_day    :date
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  user_id     :integer
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
