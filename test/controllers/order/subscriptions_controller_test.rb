require 'test_helper'

class Order::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_subscriptions_new_url
    assert_response :success
  end

end
