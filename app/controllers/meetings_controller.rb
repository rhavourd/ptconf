class MeetingsController < ApplicationController
  before_filter :load_conference_date

  def index
  end

  def make_schedule
    load_or_create_meeting
    @meeting.make_schedule(@student_id, @parent_id)
    @meeting.save

    respond_to do |format|
      format.js
    end

  end

  def cancel_schedule
    load_or_create_meeting
    @meeting.mark_available
    @meeting.save

    respond_to do |format|
      format.js
    end

  end

  def mark_personal
    load_or_create_meeting
    @meeting.mark_personal
    @meeting.save

    respond_to do |format|
      format.js
    end

  end

  def mark_available
    load_or_create_meeting
    @meeting.mark_available
    @meeting.save

    respond_to do |format|
      format.js
    end

  end

  def create

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to store_url }
        format.js
        format.json { render json: @line_item,
                             status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private

  def load_conference_date
    @conference_date = current_user.conference_dates.find(params[:conference_date_id])
    @student_id = params[:student_id]
    @parent_id = params[:parent_id]

    logger.debug "load_conference_date:: @conference_date => #{@conference_date.inspect}"
    logger.debug "  @student_id => #{@student_id}"
    logger.debug "  @parent_id => #{@parent_id}"
  end

  def load_or_create_meeting
    start_time = Time.parse(params[:start_time])
    @meeting = @conference_date.meetings.between_start_end_time(start_time).first
    if @meeting.nil?
      @meeting = @conference_date.meetings.build
      @meeting.start_time = start_time
      @meeting.end_time = start_time + (@conference_date.duration * 60)
    end
  end

end
