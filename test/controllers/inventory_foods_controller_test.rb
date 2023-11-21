require "test_helper"

class InventoryFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get inventory_foods_create_url
    assert_response :success
  end

  test "should get destroy" do
    get inventory_foods_destroy_url
    assert_response :success
  end
end
