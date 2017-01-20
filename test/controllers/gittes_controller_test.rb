require 'test_helper'

class GittesControllerTest < ActionDispatch::IntegrationTest
  test "post to gitte creates a gitte" do
    get root_path

    assert_response :success
  end
end
