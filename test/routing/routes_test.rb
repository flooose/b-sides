require 'test_helper'

class RoutesTest < ActionController::IntegrationTest
  test "gittes" do
    assert_recognizes({ controller: 'gittes', action: 'create' }, { path: 'gittes', method: :post })

    assert_generates '/gittess', { controller: 'gittes', action: 'created' }
  end
end
