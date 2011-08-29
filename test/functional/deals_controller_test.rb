require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Deal.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Deal.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to deals_url
  end

  def test_index
    get :index
    assert_template 'index'
  end
end
