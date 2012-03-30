class ConferenceDate < ActiveRecord::Base
  belongs_to :user
  has_many :meetings, :dependent => :destroy

  validates :user_id, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :duration, :numericality => { :only_integer => true, :greater_than => 0,
                                          :less_than_or_equal_to => 3600}


  def time_periods
    @time_periods ||= TimePeriods.new(self)
  end
end
