require 'test_helper'

class Admin::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_admin_new_url
    assert_response :success
  end

end
