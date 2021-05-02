require 'test_helper'

class Hogehoge::TestAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hogehoge_test_admin_new_url
    assert_response :success
  end

end
