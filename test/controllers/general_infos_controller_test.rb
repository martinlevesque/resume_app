require 'test_helper'

class GeneralInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_info = general_infos(:one)
  end

  test "should get index" do
    get general_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_general_info_url
    assert_response :success
  end

  test "should create general_info" do
    assert_difference('GeneralInfo.count') do
      post general_infos_url, params: { general_info: { data: @general_info.data, linkedin: @general_info.linkedin } }
    end

    assert_redirected_to general_info_url(GeneralInfo.last)
  end

  test "should show general_info" do
    get general_info_url(@general_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_info_url(@general_info)
    assert_response :success
  end

  test "should update general_info" do
    patch general_info_url(@general_info), params: { general_info: { data: @general_info.data, linkedin: @general_info.linkedin } }
    assert_redirected_to general_info_url(@general_info)
  end

  test "should destroy general_info" do
    assert_difference('GeneralInfo.count', -1) do
      delete general_info_url(@general_info)
    end

    assert_redirected_to general_infos_url
  end
end
