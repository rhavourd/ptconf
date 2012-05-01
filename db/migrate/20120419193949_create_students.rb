class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :nickname
      t.references :organization

      t.timestamps
    end
    add_index :students, :organization_id
  end
end
