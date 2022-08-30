require "test_helper"

class DraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drafts_index_url
    assert_response :success
  end

  test "should get update" do
    get drafts_update_url
    assert_response :success
  end

  test "should get delete" do
    get drafts_delete_url
    assert_response :success
  end
end
