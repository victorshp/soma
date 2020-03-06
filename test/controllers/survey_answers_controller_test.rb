require 'test_helper'

class SurveyAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get survey_answers_create_url
    assert_response :success
  end

end
