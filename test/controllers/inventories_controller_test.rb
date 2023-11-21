require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get inventories_index_url
    assert_response :success
  end

  test 'should get show' do
    get inventories_show_url
    assert_response :success
  end

  test 'should get new' do
    get inventories_new_url
    assert_response :success
  end

  test 'should get create' do
    get inventories_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get inventories_destroy_url
    assert_response :success
  end
end
