class CreateParentStudentJoinTable < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :student_id
      t.integer :parent_id
    end
  end
end
