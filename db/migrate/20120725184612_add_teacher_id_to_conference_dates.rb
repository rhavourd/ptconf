class AddTeacherIdToConferenceDates < ActiveRecord::Migration
  def change
    add_column :conference_dates, :teacher_id, :integer
    add_index :conference_dates, :teacher_id

    remove_index :conference_dates, :user_id
    remove_column :conference_dates, :user_id

  end
end
