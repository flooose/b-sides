require 'test_helper'

class GittesControllerTest < ActionDispatch::IntegrationTest
  # TODO: This shold be in integration/routes_test.rb, but the
  # emacs test runner doesn't find that file for some reason
  test "gittes" do
    assert_recognizes({ controller: 'gittes', action: 'create' }, { path: 'gittes', method: :post })

    assert_generates '/gittes', { controller: 'gittes', action: 'create' }
  end


  test "#create gitte creates a new gitte" do
    post gittes_path, params: {url: 'example.com', reponame: 'b-sides'}

    assert_response 200
  end

  test "#returns error when url is missing" do
    post gittes_path, params: {reponame: 'b-sides'}

    assert_response 500
  end

end
