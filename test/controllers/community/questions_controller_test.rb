require 'test_helper'

class Community::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get community_questions_index_url
    assert_response :success
  end

  test "should get new" do
    get community_questions_new_url
    assert_response :success
  end

end
