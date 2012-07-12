# == Schema Information
#
# Table name: meetings
#
#  conference_date_id :integer
#  created_at         :datetime         not null
#  end_time           :datetime
#  id                 :integer          not null, primary key
#  meet_with          :string(255)
#  parent_id          :integer
#  start_time         :datetime
#  status             :string(9)
#  student_id         :integer
#  updated_at         :datetime         not null
#

class Meeting < ActiveRecord::Base
  belongs_to :conference_date
  belongs_to :student
  belongs_to :parent

  validates_presence_of :conference_date_id, :start_time, :end_time, :status

  scope :between_start_end_time, lambda {|time| puts "\nscope: utc?=#{time.utc?} time=#{time}"; where("start_time <= ? AND end_time > ?", time, time) }

=begin
  def self.between_start_end_time(time)
    logger.debug "Meeting#between_start_end_time time=>#{time}"
    logger.debug "  self=#{self}"
    self.select do |m|
      logger.debug "  m.start_time => #{m.start_time}"
      m.start_time <= time && m.end_time >= time
    end

  end
=end

  def meeting_is_for_this_student?(student)
    student_id == (student.respond_to?(:to_i) ? student.to_i : student.id)
  end

  def meet_with
    val = ""
    val = student.full_name if student.present?
    val += "no student!" unless student.present?
    val += " (" + parent.full_name + ")"  if parent.present?
    val
  end

  def formatted_start_time
    start_time.strftime("%I:%M %p")
  end

  def is_available?
    status.nil? || (status.casecmp("Available") == 0)
  end

  def is_personal?
    status.present? && (status.casecmp("Personal") == 0)
  end

  def mark_available
    unless self.is_available?
      self.status = "Available"
      self.parent_id = nil
      self.student_id = nil
    end
  end

  def mark_personal
    self.status = "Personal"  unless self.is_personal?
  end

  def make_schedule(student_id, parent_id)
    self.status = "Busy"
    self.parent_id = parent_id
    self.student_id = student_id
  end

end
