require 'test_helper'

class SomesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Some.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Some.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Some.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to some_url(assigns(:some))
  end

  def test_edit
    get :edit, :id => Some.first
    assert_template 'edit'
  end

  def test_update_invalid
    Some.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Some.first
    assert_template 'edit'
  end

  def test_update_valid
    Some.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Some.first
    assert_redirected_to some_url(assigns(:some))
  end

  def test_destroy
    some = Some.first
    delete :destroy, :id => some
    assert_redirected_to somes_url
    assert !Some.exists?(some.id)
  end
end
