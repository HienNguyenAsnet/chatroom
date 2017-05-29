require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get room_new_url
    assert_response :success
  end

  test "should get create" do
    get room_create_url
    assert_response :success
  end

end
