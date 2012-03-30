class DashboardsController < ApplicationController
  before_filter :authenticate

  def index
    @courses = current_user.courses
  end
end
