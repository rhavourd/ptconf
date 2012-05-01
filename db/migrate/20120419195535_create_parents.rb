class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :nickname
      t.references :organization

      t.timestamps
    end
    add_index :parents, :organization_id
  end
end
