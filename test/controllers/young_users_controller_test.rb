require "test_helper"

class YoungUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get young_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get young_users_edit_url
    assert_response :success
  end
end
