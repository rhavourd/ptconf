class Roster < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  attr_accessible :student_id, :course_id

  validates_presence_of :student_id
  validates_presence_of :course_id

  def course_name
    course.full_name  if course
  end

  def student_name
    student.full_name if student
  end

end
