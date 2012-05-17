class Relationship < ActiveRecord::Base
  belongs_to :parent
  belongs_to :student
  validates :parent_id, presence: true
  validates :student_id, presence: true

  def parent_name
    parent.full_name  if parent
  end

  def student_name
    student.full_name if student
  end
end
