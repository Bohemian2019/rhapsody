require 'test_helper'

class User::HistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get user_histories_all_url
    assert_response :success
  end

  test "should get index" do
    get user_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get user_histories_show_url
    assert_response :success
  end

end
