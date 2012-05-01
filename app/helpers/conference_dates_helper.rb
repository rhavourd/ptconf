module ConferenceDatesHelper
  def calendar_month_name(calendar = nil)
    logger.debug "calendar_month_name calendar => #{calendar.inspect}"
    if calendar.respond_to?(:date)
      date = calendar.first.date
    else
      date = Time.now
    end

    date.strftime("%B")
  end
end
