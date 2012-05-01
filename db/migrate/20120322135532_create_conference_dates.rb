class CreateConferenceDates < ActiveRecord::Migration
  def change
    create_table :conference_dates do |t|
      t.date :date
      t.references :user
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration

      t.timestamps
    end
    add_index :conference_dates, :user_id
  end
end
