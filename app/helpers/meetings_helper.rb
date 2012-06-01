module MeetingsHelper

  def toggle_status_path(period)
    if period.is_available?
      "mark_personal_conference_date_meeting_path"
    else
      "mark_available_conference_date_meeting_path"
    end
  end

  def mark_personal_button(conference_date, period, period_counter)
    target = (period_counter.is_a?(String) ? period_counter : "period-#{period_counter}")
    period_meeting_id = (period.respond_to?(:meeting_id) ? period.meeting_id : period.id)

    button_to 'Personal',
              mark_personal_conference_date_meeting_path(conference_date, period_meeting_id, start_time: period.start_time,
                                                         update: target),
              remote: true
  end

  def mark_available_button(conference_date, period, period_counter)
    target = (period_counter.is_a?(String) ? period_counter : "period-#{period_counter}")
    period_meeting_id = (period.respond_to?(:meeting_id) ? period.meeting_id : period.id)

    button_to 'Available',
              mark_available_conference_date_meeting_path(conference_date, period_meeting_id, start_time: period.start_time,
                                                          update: target),
              remote: true
  end


end
