class ConferenceDatesController < ApplicationController
  before_filter :authenticate

  # GET /conference_dates
  # GET /conference_dates.json
  def index
    @conference_dates = current_user.conference_dates

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conference_dates }
    end
  end

  # GET /conference_dates/1
  # GET /conference_dates/1.json
  def show
    @conference_date = ConferenceDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conference_date }
    end
  end

  # GET /conference_dates/new
  # GET /conference_dates/new.json
  def new
    @conference_date = ConferenceDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conference_date }
    end
  end

  # GET /conference_dates/1/edit
  def edit
    @conference_date = ConferenceDate.find(params[:id])
  end

  # POST /conference_dates
  # POST /conference_dates.json
  def create
    @conference_date = current_user.conference_dates.build(params[:conference_date])

    respond_to do |format|
      if @conference_date.save
        format.html { redirect_to @conference_date, notice: 'Conference date was successfully created.' }
        format.json { render json: @conference_date, status: :created, location: @conference_date }
      else
        format.html { render action: "new" }
        format.json { render json: @conference_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conference_dates/1
  # PUT /conference_dates/1.json
  def update
    @conference_date = ConferenceDate.find(params[:id])

    respond_to do |format|
      if @conference_date.update_attributes(params[:conference_date])
        format.html { redirect_to @conference_date, notice: 'Conference date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conference_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conference_dates/1
  # DELETE /conference_dates/1.json
  def destroy
    @conference_date = ConferenceDate.find(params[:id])
    @conference_date.destroy

    respond_to do |format|
      format.html { redirect_to conference_dates_url }
      format.json { head :no_content }
    end
  end
end
