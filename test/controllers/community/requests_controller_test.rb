require 'test_helper'

class Community::RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get community_requests_new_url
    assert_response :success
  end

end
