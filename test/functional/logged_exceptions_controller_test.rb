require 'test_helper'

class LoggedExceptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logged_exceptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logged_exception" do
    assert_difference('LoggedException.count') do
      post :create, :logged_exception => { }
    end

    assert_redirected_to logged_exception_path(assigns(:logged_exception))
  end

  test "should show logged_exception" do
    get :show, :id => logged_exceptions(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => logged_exceptions(:one).id
    assert_response :success
  end

  test "should update logged_exception" do
    put :update, :id => logged_exceptions(:one).id, :logged_exception => { }
    assert_redirected_to logged_exception_path(assigns(:logged_exception))
  end

  test "should destroy logged_exception" do
    assert_difference('LoggedException.count', -1) do
      delete :destroy, :id => logged_exceptions(:one).id
    end

    assert_redirected_to logged_exceptions_path
  end
end
