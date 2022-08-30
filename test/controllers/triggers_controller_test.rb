require "test_helper"

class TriggersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get triggers_index_url
    assert_response :success
  end

  test "should get create" do
    get triggers_create_url
    assert_response :success
  end

  test "should get update" do
    get triggers_update_url
    assert_response :success
  end

  test "should get delete" do
    get triggers_delete_url
    assert_response :success
  end
end
