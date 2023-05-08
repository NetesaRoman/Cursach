require "test_helper"

class MovieShortsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get movie_shorts_show_url
    assert_response :success
  end

  test "should get new" do
    get movie_shorts_new_url
    assert_response :success
  end

  test "should get index" do
    get movie_shorts_index_url
    assert_response :success
  end

  test "should get edit" do
    get movie_shorts_edit_url
    assert_response :success
  end
end
