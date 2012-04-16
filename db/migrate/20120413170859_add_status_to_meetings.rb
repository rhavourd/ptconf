class AddStatusToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :status, :string, :limit => 9

  end
end
