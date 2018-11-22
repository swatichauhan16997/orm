require 'test_helper'

class HomeDeliveriesDeliveryBoysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_deliveries_delivery_boys_index_url
    assert_response :success
  end

  test "should get new" do
    get home_deliveries_delivery_boys_new_url
    assert_response :success
  end

  test "should get edit" do
    get home_deliveries_delivery_boys_edit_url
    assert_response :success
  end

  test "should get show" do
    get home_deliveries_delivery_boys_show_url
    assert_response :success
  end

end
