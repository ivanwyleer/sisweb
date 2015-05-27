require 'test_helper'

class CalendarsControllerTest < ActionController::TestCase
  setup do
    @calendar = calendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar" do
    assert_difference('Calendar.count') do
      post :create, calendar: { date_marked: @calendar.date_marked, date_request: @calendar.date_request, date_send: @calendar.date_send, hair_color: @calendar.hair_color, hair_size: @calendar.hair_size, observation: @calendar.observation, professional_id: @calendar.professional_id, sservice_id: @calendar.sservice_id, status: @calendar.status, user_id: @calendar.user_id }
    end

    assert_redirected_to calendar_path(assigns(:calendar))
  end

  test "should show calendar" do
    get :show, id: @calendar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar
    assert_response :success
  end

  test "should update calendar" do
    patch :update, id: @calendar, calendar: { date_marked: @calendar.date_marked, date_request: @calendar.date_request, date_send: @calendar.date_send, hair_color: @calendar.hair_color, hair_size: @calendar.hair_size, observation: @calendar.observation, professional_id: @calendar.professional_id, sservice_id: @calendar.sservice_id, status: @calendar.status, user_id: @calendar.user_id }
    assert_redirected_to calendar_path(assigns(:calendar))
  end

  test "should destroy calendar" do
    assert_difference('Calendar.count', -1) do
      delete :destroy, id: @calendar
    end

    assert_redirected_to calendars_path
  end
end
