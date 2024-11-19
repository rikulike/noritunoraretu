require "test_helper"

class Senior::SeniorUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get senior_senior_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get senior_senior_users_edit_url
    assert_response :success
  end
end
