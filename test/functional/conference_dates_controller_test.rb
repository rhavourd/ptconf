require 'test_helper'

class ConferenceDatesControllerTest < ActionController::TestCase
  setup do
    @conference_date = conference_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conference_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conference_day" do
    assert_difference('ConferenceDate.count') do
      post :create, conference_date: @conference_date.attributes
    end

    assert_redirected_to conference_day_path(assigns(:conference_date))
  end

  test "should show conference_day" do
    get :show, id: @conference_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conference_date
    assert_response :success
  end

  test "should update conference_day" do
    put :update, id: @conference_date, conference_date: @conference_date.attributes
    assert_redirected_to conference_day_path(assigns(:conference_date))
  end

  test "should destroy conference_day" do
    assert_difference('ConferenceDate.count', -1) do
      delete :destroy, id: @conference_date
    end

    assert_redirected_to conference_days_path
  end
end
