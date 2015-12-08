require 'test_helper'

class BuzzesControllerTest < ActionController::TestCase
  before do
    BuzzSession.create!
  end

  test "create an accepted buzz when it's the first one" do
    post :create

    assert_equal 200, response.status
    data = OpenStruct.new(JSON.parse(response.body))

    assert_equal true, data.accepted
  end

  test "create a not accepted buzz when it's not the first one" do
    post :create

    assert_equal 200, response.status
    data = OpenStruct.new(JSON.parse(response.body))

    assert_equal true, data.accepted
  end
end
