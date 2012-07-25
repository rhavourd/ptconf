class AddTeacherIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :teacher_id, :integer
    remove_column :courses, :user_id
  end
end
