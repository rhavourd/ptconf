class AddActiveUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :active_user, :boolean, :default => false

  end
end
