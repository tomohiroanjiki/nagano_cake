require 'test_helper'

class Hoge::TestAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hoge_test_admin_new_url
    assert_response :success
  end

end
