require "test_helper"

class NotinhasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notinhas_index_url
    assert_response :success
  end

  test "should get edit" do
    get notinhas_edit_url
    assert_response :success
  end

  test "should get update" do
    get notinhas_update_url
    assert_response :success
  end

  test "should get delete" do
    get notinhas_delete_url
    assert_response :success
  end
end
