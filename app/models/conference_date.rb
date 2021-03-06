# == Schema Information
#
# Table name: conference_dates
#
#  created_at :datetime         not null
#  date       :date
#  duration   :integer
#  end_time   :datetime
#  id         :integer          not null, primary key
#  reason     :string(255)
#  start_time :datetime
#  updated_at :datetime         not null
#  user_id    :integer
#

class ConferenceDate < ActiveRecord::Base
  belongs_to :teacher
  has_many :meetings, :dependent => :destroy

  after_update  :set_time_to_conference_date

  validates :teacher_id, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :duration, :numericality => { :only_integer => true, :greater_than => 0,
                                          :less_than_or_equal_to => 3600}


  def time_periods
    @time_periods ||= TimePeriods.new(self)
  end

  def formatted_start_time
    start_time.strftime("%I:%M %p")
  end

  def formatted_start_time=(str)
    time = Time.parse(str)
    self.start_time = start_time.change(:hour => time.hour, :min => time.min, :sec => time.sec)
  end

  def formatted_end_time
    end_time.strftime("%I:%M %p")
  end

  def formatted_end_time=(str)
    time = Time.parse(str)
    self.end_time = end_time.change(:hour => time.hour, :min => time.min, :sec => time.sec)
  end

  def set_time_to_conference_date
    logger.debug "set_time_to_conference_date: start_time=#{start_time} end_time=#{end_time}"
    self.start_time = start_time.change(:year => date.year, :month => date.month, :day => date.day)
    self.end_time = end_time.change(:year => date.year, :month => date.month, :day => date.day)
    logger.debug "set_time_to_conference_date: start_time=#{start_time} end_time=#{end_time}"
  end
end
