require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get landing" do
    get :landing
    assert_response :success
  end

end
