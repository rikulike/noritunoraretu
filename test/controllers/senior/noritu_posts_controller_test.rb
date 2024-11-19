require "test_helper"

class Senior::NorituPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get senior_noritu_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get senior_noritu_posts_show_url
    assert_response :success
  end

  test "should get index" do
    get senior_noritu_posts_index_url
    assert_response :success
  end

  test "should get edit" do
    get senior_noritu_posts_edit_url
    assert_response :success
  end
end
