class AddActiveTeacherToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :active_teacher, :boolean, :default => false

  end
end
