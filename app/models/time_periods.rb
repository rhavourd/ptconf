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
    periods = []
    time = @conference_date.start_time
    begin
      periods << Period.new(time, time + @conference_date.duration * 60, @default_status)
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
  attr_reader :status

  def initialize(start_time, end_time, status)
    @start_time = start_time
    @end_time = end_time
    @duration = ((@end_time - @start_time).to_int / 60).to_int
    @status = status
  end

  def formatted_start_time
    formatted_time @start_time
  end

  def formatted_time(time)
    time.strftime("%I:%M %p %Z")
  end
end