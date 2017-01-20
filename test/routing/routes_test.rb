require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "gittes" do
    assert_recognizes({ controller: 'gittes', action: 'create' }, { path: 'gittes', method: :post })

    assert_generates '/gittes', { controller: 'gittes', action: 'create' }
  end
end
