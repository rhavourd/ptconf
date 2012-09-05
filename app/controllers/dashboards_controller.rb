class DashboardsController < ApplicationController

  def index
    @courses = current_user.courses_list
    @conference_dates = current_user.conference_dates_list
    @meetings = current_user.meetings
  end
end
