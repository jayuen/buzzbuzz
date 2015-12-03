require 'test_helper'

class BuzzesControllerTest < ActionController::TestCase
  test "should create" do
    post :create

    assert_equal 200, response.status
  end
end
