require "test_helper"

class WisdomPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wisdom_posts_new_url
    assert_response :success
  end

  test "should get index" do
    get wisdom_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get wisdom_posts_show_url
    assert_response :success
  end
end
