module MeetingsHelper

  def toggle_status_path(period)
    if period.is_available?
      "mark_personal_conference_date_meeting_path"
    else
      "mark_available_conference_date_meeting_path"
    end
  end

  def formatted_start_time
    formatted_time @start_time
  end

  def formatted_time(time)
    time.strftime("%I:%M %p %Z")
  end


end
