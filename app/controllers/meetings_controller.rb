class MeetingsController < ApplicationController
  def index
  end

  def xtoggle
    logger.debug "********************************* In meetings!"
    logger.debug "User=#{current_user}"
    @conference_date = current_user.conference_dates.find(params[:conference_date_id])
    logger.debug "@c=#{@conference_date.to_yaml}"

    start_time = Time.parse(params[:start_time]).time_of_day!
    @meeting = @conference_date.meetings.between_start_end_time(start_time)
    logger.debug "@meeting: class #{@meeting.class} #{@meeting.to_yaml}"

    respond_to do |format|
      format.js
    end
  end

  def create
    @conference_date = current_user.conference_dates.find(params[:conference_date_id])
    puts params

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

  def toggle
  end
end
