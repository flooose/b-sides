require 'test_helper'

class GitteTest < ActiveSupport::TestCase
  test "url is required" do
    gitte = Gitte.new(reponame: "doesn't matter")
    assert(!gitte.valid?)
  end
end
