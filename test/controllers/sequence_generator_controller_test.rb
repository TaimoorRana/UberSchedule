require 'test_helper'

class SequenceGeneratorControllerTest < ActionController::TestCase
  test "should get generateSequence" do
    get :generateSequence
    assert_response :success
  end

end
