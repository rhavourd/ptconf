class TimePeriods
  attr_reader :the_date
  attr_accessor :periods

  def initialize(conference_date, default_status = "Available")
    @conference_date = conference_date
    @default_status = default_status
    @the_date = @conference_date.date
    @periods = initialize_periods
  end

  def initialize_periods
    return unless @conference_date.start_time && @conference_date.duration

    periods = []
    time = @conference_date.start_time
    begin
      period = Period.new(time, time + @conference_date.duration * 60, @default_status)
      meeting = @conference_date.meetings.between_start_end_time(period.start_time).first
      if meeting.present?
        period.meeting_id = meeting.id
        period.status = meeting.status
      end
      periods << period
      puts "init_periods: time=#{time} end_time=#{@conference_date.end_time} count=#{periods.count}"
      puts "  meeting?=#{meeting.present?} period=#{period.inspect}"
    end while (time += @conference_date.duration * 60) <= @conference_date.end_time
    periods
  end

  def set_status
  end

  def count
    @periods.count
  end

  def each
    @periods.each do |mtg|
      yield mtg
    end
  end

end


class Period
  attr_reader :start_time
  attr_reader :end_time
  attr_reader :duration
  attr_accessor :status
  attr_accessor :meeting_id

  def initialize(start_time, end_time, status)
    @start_time = start_time
    @end_time = end_time
    @duration = ((@end_time - @start_time) / 60).to_int
    @status = status
    @meeting_id = 0
  end

  def meet_with
    val = ""
    if @meeting_id.present?
      meeting = Meeting.find(@meeting_id)
      student = meeting.student
      parent = meeting.parent
      val = student.full_name if student.present?
      val += " (" + parent.full_name + ")"  if parent.present?
    end
    val
  end

  def meeting_is_for_this_student?(student)
    if @meeting_id.present?
      meeting = Meeting.find(@meeting_id)
      meeting.meeting_is_for_this_student?(student)
    end
  end

  def formatted_start_time
    formatted_time @start_time
  end

  def formatted_time(time)
    time.strftime("%I:%M %p")
  end

  def is_available?
    @status.casecmp("available") == 0
  end

  def is_personal?
    @status.casecmp("personal") == 0
  end

  def mark_available
    puts "self=#{self.inspect}"
    @status = "available"  unless self.is_available?
  end

  def mark_personal
    puts "self.is_personal? #{self.is_personal?}  self=#{self.inspect}"
    @status = "personal"  unless self.is_personal?
  end
end