require 'test_helper'

class MasterOrdersControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get master_orders_new_url
    assert_response :success
  end

  test "should get index" do
    get master_orders_index_url
    assert_response :success
  end

  test "should get edit" do
    get master_orders_edit_url
    assert_response :success
  end

  test "should get show" do
    get master_orders_show_url
    assert_response :success
  end

end
