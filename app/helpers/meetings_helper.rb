module MeetingsHelper

  def toggle_status_path(period)
    if period.is_available?
      "mark_personal_conference_date_meeting_path"
    else
      "mark_available_conference_date_meeting_path"
    end
  end

  def mark_personal_button(conference_date, period, period_counter)
    button_to 'Personal',
              mark_personal_conference_date_meeting_path(conference_date, period.meeting_id, start_time: period.start_time, update: "period-#{period_counter}"),
              remote: true
  end

  def mark_available_button(conference_date, period, period_counter)
    button_to 'Available',
              mark_available_conference_date_meeting_path(conference_date, period.meeting_id, start_time: period.start_time, update: "period-#{period_counter}"),
              remote: true
  end


end
