require "test_helper"

class TemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get templates_index_url
    assert_response :success
  end

  test "should get create" do
    get templates_create_url
    assert_response :success
  end

  test "should get update" do
    get templates_update_url
    assert_response :success
  end

  test "should get delete" do
    get templates_delete_url
    assert_response :success
  end
end
