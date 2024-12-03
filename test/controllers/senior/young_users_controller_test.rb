require "test_helper"

class Senior::YoungUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get senior_young_users_show_url
    assert_response :success
  end
end
