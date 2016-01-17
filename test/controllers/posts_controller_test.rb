require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get feed" do
    get :feed
    assert_response :success
  end

end
