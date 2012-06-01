class Roster < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  attr_accessible :student_id, :course_id

  validates_presence_of :student_id, presence: true
  validates_presence_of :course_id, presence: true

end
