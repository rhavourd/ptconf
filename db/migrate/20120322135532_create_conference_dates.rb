class CreateConferenceDays < ActiveRecord::Migration
  def change
    create_table :conference_days do |t|
      t.date :date
      t.references :user
      t.time :start_time
      t.time :end_time
      t.integer :duration

      t.timestamps
    end
    add_index :conference_days, :user_id
  end
end
