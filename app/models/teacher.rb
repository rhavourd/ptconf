# == Schema Information
#
# Table name: teachers
#
#  active_teacher :boolean          default(FALSE)
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Teacher < ActiveRecord::Base
  belongs_to :user
end
