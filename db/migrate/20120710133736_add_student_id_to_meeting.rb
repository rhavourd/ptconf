class AddStudentIdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :student_id, :integer
    add_column :meetings, :parent_id, :integer
  end
end
