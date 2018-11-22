require 'test_helper'

class DeliveryBoysControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get delivery_boys_index_url
    assert_response :success
  end

  test "should get show" do
    get delivery_boys_show_url
    assert_response :success
  end

  test "should get edit" do
    get delivery_boys_edit_url
    assert_response :success
  end

end
