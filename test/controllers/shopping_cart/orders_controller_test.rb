require 'test_helper'

class ShoppingCart::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shopping_cart_orders_new_url
    assert_response :success
  end

end
