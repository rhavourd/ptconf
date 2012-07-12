# == Schema Information
#
# Table name: courses
#
#  code        :string(255)
#  created_at  :datetime         not null
#  description :string(255)
#  first_day   :date
#  id          :integer          not null, primary key
#  last_day    :date
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
