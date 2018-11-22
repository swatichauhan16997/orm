require 'test_helper'

class HomedeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get homedeliveries_new_url
    assert_response :success
  end

  test "should get index" do
    get homedeliveries_index_url
    assert_response :success
  end

  test "should get edit" do
    get homedeliveries_edit_url
    assert_response :success
  end

  test "should get show" do
    get homedeliveries_show_url
    assert_response :success
  end

end
