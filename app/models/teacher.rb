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
  has_many :courses, :dependent => :destroy
  has_many :conference_dates, :dependent => :destroy
  has_many :meetings, :through => :conference_dates

  has_many :meetings_with_a_student, :class_name => "Meeting",
      :through => :conference_dates, :source => :meetings,
      :conditions => "student_id IS NOT NULL"

  def full_name
    user.full_name  if user.present?
  end
end
