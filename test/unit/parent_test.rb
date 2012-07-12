# == Schema Information
#
# Table name: parents
#
#  created_at      :datetime         not null
#  email           :string(255)
#  first_name      :string(255)
#  full_name       :string(255)
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  nickname        :string(255)
#  organization_id :integer
#  phone           :string(255)
#  phone_has_sms   :boolean
#  updated_at      :datetime         not null
#

require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
