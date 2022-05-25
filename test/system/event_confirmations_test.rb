require "application_system_test_case"

class EventConfirmationsTest < ApplicationSystemTestCase
  setup do
    @event_confirmation = event_confirmations(:one)
  end

  test "visiting the index" do
    visit event_confirmations_url
    assert_selector "h1", text: "Event confirmations"
  end

  test "should create event confirmation" do
    visit event_confirmations_url
    click_on "New event confirmation"

    click_on "Create Event confirmation"

    assert_text "Event confirmation was successfully created"
    click_on "Back"
  end

  test "should update Event confirmation" do
    visit event_confirmation_url(@event_confirmation)
    click_on "Edit this event confirmation", match: :first

    click_on "Update Event confirmation"

    assert_text "Event confirmation was successfully updated"
    click_on "Back"
  end

  test "should destroy Event confirmation" do
    visit event_confirmation_url(@event_confirmation)
    click_on "Destroy this event confirmation", match: :first

    assert_text "Event confirmation was successfully destroyed"
  end
end
