require "test_helper"

class EventConfirmationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_confirmation = event_confirmations(:one)
  end

  test "should get index" do
    get event_confirmations_url
    assert_response :success
  end

  test "should get new" do
    get new_event_confirmation_url
    assert_response :success
  end

  test "should create event_confirmation" do
    assert_difference("EventConfirmation.count") do
      post event_confirmations_url, params: { event_confirmation: {  } }
    end

    assert_redirected_to event_confirmation_url(EventConfirmation.last)
  end

  test "should show event_confirmation" do
    get event_confirmation_url(@event_confirmation)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_confirmation_url(@event_confirmation)
    assert_response :success
  end

  test "should update event_confirmation" do
    patch event_confirmation_url(@event_confirmation), params: { event_confirmation: {  } }
    assert_redirected_to event_confirmation_url(@event_confirmation)
  end

  test "should destroy event_confirmation" do
    assert_difference("EventConfirmation.count", -1) do
      delete event_confirmation_url(@event_confirmation)
    end

    assert_redirected_to event_confirmations_url
  end
end
