require "test_helper"

class OpinionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get opinions_new_url
    assert_response :success
  end

  test "should get create" do
    get opinions_create_url
    assert_response :success
  end

  test "should get edit" do
    get opinions_edit_url
    assert_response :success
  end

  test "should get update" do
    get opinions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get opinions_destroy_url
    assert_response :success
  end
end
