class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :conference_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :meet_with

      t.timestamps
    end
    add_index :meetings, :conference_date_id
  end
end
