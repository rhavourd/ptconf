class CreateStudentCourseJoinTable < ActiveRecord::Migration
  def change
    create_table :students_courses, :id => false do |t|
      t.integer :student_id
      t.integer :course_id
    end
  end
end
