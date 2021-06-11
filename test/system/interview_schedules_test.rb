require "application_system_test_case"

class InterviewSchedulesTest < ApplicationSystemTestCase
  setup do
    @interview_schedule = interview_schedules(:one)
  end

  test "visiting the index" do
    visit interview_schedules_url
    assert_selector "h1", text: "Interview Schedules"
  end

  test "creating a Interview schedule" do
    visit interview_schedules_url
    click_on "New Interview Schedule"

    fill_in "End time", with: @interview_schedule.End_Time
    fill_in "Start time", with: @interview_schedule.Start_Time
    fill_in "Interviewee", with: @interview_schedule.interviewee_id
    fill_in "Interviewer", with: @interview_schedule.interviewer_id
    click_on "Create Interview schedule"

    assert_text "Interview schedule was successfully created"
    click_on "Back"
  end

  test "updating a Interview schedule" do
    visit interview_schedules_url
    click_on "Edit", match: :first

    fill_in "End time", with: @interview_schedule.End_Time
    fill_in "Start time", with: @interview_schedule.Start_Time
    fill_in "Interviewee", with: @interview_schedule.interviewee_id
    fill_in "Interviewer", with: @interview_schedule.interviewer_id
    click_on "Update Interview schedule"

    assert_text "Interview schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Interview schedule" do
    visit interview_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interview schedule was successfully destroyed"
  end
end
