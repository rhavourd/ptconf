class DashboardsController < ApplicationController

  def index
    @courses = current_user.courses
    @conference_dates = current_user.conference_dates
  end
end
