require "application_system_test_case"

class FeedbacksTest < ApplicationSystemTestCase
  setup do
    @feedback = feedbacks(:one)
  end

  test "visiting the index" do
    visit feedbacks_url
    assert_selector "h1", text: "Feedbacks"
  end

  test "should create feedback" do
    visit feedbacks_url
    click_on "New feedback"

    fill_in "Benefit discovery rating", with: @feedback.benefit_discovery_rating
    fill_in "Company", with: @feedback.company
    fill_in "Email", with: @feedback.email
    fill_in "Enjoyment experience rating", with: @feedback.enjoyment_experience_rating
    fill_in "First name", with: @feedback.first_name
    fill_in "Identification number", with: @feedback.identification_number
    fill_in "Interaction participation rating", with: @feedback.interaction_participation_rating
    fill_in "Last name", with: @feedback.last_name
    fill_in "Notes", with: @feedback.notes
    click_on "Create Feedback"

    assert_text "Feedback was successfully created"
    click_on "Back"
  end

  test "should update Feedback" do
    visit feedback_url(@feedback)
    click_on "Edit this feedback", match: :first

    fill_in "Benefit discovery rating", with: @feedback.benefit_discovery_rating
    fill_in "Company", with: @feedback.company
    fill_in "Email", with: @feedback.email
    fill_in "Enjoyment experience rating", with: @feedback.enjoyment_experience_rating
    fill_in "First name", with: @feedback.first_name
    fill_in "Identification number", with: @feedback.identification_number
    fill_in "Interaction participation rating", with: @feedback.interaction_participation_rating
    fill_in "Last name", with: @feedback.last_name
    fill_in "Notes", with: @feedback.notes
    click_on "Update Feedback"

    assert_text "Feedback was successfully updated"
    click_on "Back"
  end

  test "should destroy Feedback" do
    visit feedback_url(@feedback)
    click_on "Destroy this feedback", match: :first

    assert_text "Feedback was successfully destroyed"
  end
end
