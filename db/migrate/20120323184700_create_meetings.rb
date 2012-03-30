class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :conference_date
      t.time :start_time
      t.time :end_time
      t.string :meet_with

      t.timestamps
    end
    add_index :meetings, :conference_day_id
  end
end
