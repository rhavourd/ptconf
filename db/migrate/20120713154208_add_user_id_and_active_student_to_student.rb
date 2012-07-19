class AddUserIdAndActiveStudentToStudent < ActiveRecord::Migration
  def change
    add_column :students, :user_id, :integer

    add_column :students, :active_student, :boolean, :default => false

  end
end
