require 'test_helper'

class FoodCategoriesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get food_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get food_categories_edit_url
    assert_response :success
  end

  test "should get index" do
    get food_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get food_categories_show_url
    assert_response :success
  end

end
