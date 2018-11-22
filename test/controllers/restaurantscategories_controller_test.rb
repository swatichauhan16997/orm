require 'test_helper'

class RestaurantscategoriesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get restaurantscategories_new_url
    assert_response :success
  end

  test "should get show" do
    get restaurantscategories_show_url
    assert_response :success
  end

  test "should get edit" do
    get restaurantscategories_edit_url
    assert_response :success
  end

  test "should get index" do
    get restaurantscategories_index_url
    assert_response :success
  end

end
