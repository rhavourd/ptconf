# == Schema Information
#
# Table name: meetings
#
#  id                 :integer         not null, primary key
#  conference_date_id :integer
#  start_time         :time
#  end_time           :time
#  meet_with          :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  status             :string(9)
#

require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
