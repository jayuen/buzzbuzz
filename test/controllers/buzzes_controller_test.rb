require 'test_helper'

class BuzzesControllerTest < ActionController::TestCase
  test "should create and be accepted" do
    post :create

    assert_equal 200, response.status
    data = OpenStruct.new(JSON.parse(response.body))

    assert_equal true, data.accepted
  end
end
