class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :description
      t.date :first_day
      t.date :last_day

      t.timestamps
    end
  end
end
