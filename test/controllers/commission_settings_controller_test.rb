require 'test_helper'

class CommissionSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get commission_settings_new_url
    assert_response :success
  end

  test "should get edit" do
    get commission_settings_edit_url
    assert_response :success
  end

  test "should get index" do
    get commission_settings_index_url
    assert_response :success
  end

  test "should get show" do
    get commission_settings_show_url
    assert_response :success
  end

end
