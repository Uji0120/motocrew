require "test_helper"

class User::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_chats_new_url
    assert_response :success
  end

  test "should get index" do
    get user_chats_index_url
    assert_response :success
  end

  test "should get show" do
    get user_chats_show_url
    assert_response :success
  end
end
