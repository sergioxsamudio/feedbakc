require "test_helper"

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback = feedbacks(:one)
  end

  test "should get index" do
    get feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_url
    assert_response :success
  end

  test "should create feedback" do
    assert_difference("Feedback.count") do
      post feedbacks_url, params: { feedback: { benefit_discovery_rating: @feedback.benefit_discovery_rating, company: @feedback.company, email: @feedback.email, enjoyment_experience_rating: @feedback.enjoyment_experience_rating, first_name: @feedback.first_name, identification_number: @feedback.identification_number, interaction_participation_rating: @feedback.interaction_participation_rating, last_name: @feedback.last_name, notes: @feedback.notes } }
    end

    assert_redirected_to feedback_url(Feedback.last)
  end

  test "should show feedback" do
    get feedback_url(@feedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_url(@feedback)
    assert_response :success
  end

  test "should update feedback" do
    patch feedback_url(@feedback), params: { feedback: { benefit_discovery_rating: @feedback.benefit_discovery_rating, company: @feedback.company, email: @feedback.email, enjoyment_experience_rating: @feedback.enjoyment_experience_rating, first_name: @feedback.first_name, identification_number: @feedback.identification_number, interaction_participation_rating: @feedback.interaction_participation_rating, last_name: @feedback.last_name, notes: @feedback.notes } }
    assert_redirected_to feedback_url(@feedback)
  end

  test "should destroy feedback" do
    assert_difference("Feedback.count", -1) do
      delete feedback_url(@feedback)
    end

    assert_redirected_to feedbacks_url
  end
end
