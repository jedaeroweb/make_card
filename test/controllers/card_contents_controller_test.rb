require "test_helper"

class CardContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get card_contents_new_url
    assert_response :success
  end

  test "should get edit" do
    get card_contents_edit_url
    assert_response :success
  end

  test "should get create" do
    get card_contents_create_url
    assert_response :success
  end

  test "should get update" do
    get card_contents_update_url
    assert_response :success
  end

  test "should get destroy" do
    get card_contents_destroy_url
    assert_response :success
  end
end
