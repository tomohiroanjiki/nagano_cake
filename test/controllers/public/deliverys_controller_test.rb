require 'test_helper'

class Public::DeliverysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deliverys_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_deliverys_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_deliverys_create_url
    assert_response :success
  end

  test "should get update" do
    get public_deliverys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_deliverys_destroy_url
    assert_response :success
  end

end
