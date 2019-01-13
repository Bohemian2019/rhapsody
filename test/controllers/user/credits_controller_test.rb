require 'test_helper'

class User::CreditsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_credits_new_url
    assert_response :success
  end

  test "should get create" do
    get user_credits_create_url
    assert_response :success
  end

end
