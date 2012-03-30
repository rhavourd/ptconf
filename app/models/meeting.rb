class Meeting < ActiveRecord::Base
  belongs_to :conference_date

  scope :between_start_end_time, lambda {|time| where("start_time <= ? AND end_time >= ?", time, time) }


end
