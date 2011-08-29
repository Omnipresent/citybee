require 'test_helper'

class DealControllerTest < ActionController::TestCase
  test "should get title:string" do
    get :title:string
    assert_response :success
  end

  test "should get min_needed:integer" do
    get :min_needed:integer
    assert_response :success
  end

  test "should get max_allowed:integer" do
    get :max_allowed:integer
    assert_response :success
  end

  test "should get end_at:datetime" do
    get :end_at:datetime
    assert_response :success
  end

  test "should get summary:string" do
    get :summary:string
    assert_response :success
  end

  test "should get fine_print:string" do
    get :fine_print:string
    assert_response :success
  end

end
