class AddReasonToConferenceDay < ActiveRecord::Migration
  def change
    add_column :conference_dates, :reason, :string

  end
end
