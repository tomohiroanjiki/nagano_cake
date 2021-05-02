require 'test_helper'

class Admin::DeviseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_devise_new_url
    assert_response :success
  end

end
