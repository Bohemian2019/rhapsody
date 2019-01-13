require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get cancel_show" do
    get users_cancel_show_url
    assert_response :success
  end

  test "should get ranking_show" do
    get users_ranking_show_url
    assert_response :success
  end

  test "should get my_community_index" do
    get users_my_community_index_url
    assert_response :success
  end

end
