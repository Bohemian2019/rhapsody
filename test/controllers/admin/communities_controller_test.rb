require 'test_helper'

class Admin::CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_communities_new_url
    assert_response :success
  end

  test "should get request_index" do
    get admin_communities_request_index_url
    assert_response :success
  end

end
