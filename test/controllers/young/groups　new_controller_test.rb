require "test_helper"

class Young::Groups　newControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get young_groups　new_index_url
    assert_response :success
  end

  test "should get show" do
    get young_groups　new_show_url
    assert_response :success
  end
end
