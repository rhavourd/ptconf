# == Schema Information
#
# Table name: meetings
#
#  id                 :integer         not null, primary key
#  conference_date_id :integer
#  start_time         :time
#  end_time           :time
#  meet_with          :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  status             :string(9)
#

class Meeting < ActiveRecord::Base
  belongs_to :conference_date

  scope :between_start_end_time, lambda {|time| where("start_time <= ? AND end_time >= ?", time, time) }

  validates_presence_of :conference_date_id, :start_time, :end_time, :status

  def is_available?
    status.nil? || (status.casecmp("Available") == 0)
  end

  def is_personal?
    status.present? && (status.casecmp("Personal") == 0)
  end

  def mark_available
    self.status = "Available"  unless self.is_available?
  end

  def mark_personal
    self.status = "Personal"  unless self.is_personal?
  end

end
