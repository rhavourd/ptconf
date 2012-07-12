# == Schema Information
#
# Table name: meetings
#
#  conference_date_id :integer
#  created_at         :datetime         not null
#  end_time           :datetime
#  id                 :integer          not null, primary key
#  meet_with          :string(255)
#  parent_id          :integer
#  start_time         :datetime
#  status             :string(9)
#  student_id         :integer
#  updated_at         :datetime         not null
#

require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
