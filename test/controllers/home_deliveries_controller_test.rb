require 'test_helper'

class HomeDeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get home_deliveries_new_url
    assert_response :success
  end

  test "should get index" do
    get home_deliveries_index_url
    assert_response :success
  end

  test "should get edit" do
    get home_deliveries_edit_url
    assert_response :success
  end

  test "should get show" do
    get home_deliveries_show_url
    assert_response :success
  end

end
