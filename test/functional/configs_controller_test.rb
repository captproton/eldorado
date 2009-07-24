require 'test_helper'

class ConfigsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config" do
    assert_difference('Config.count') do
      post :create, :config => { }
    end

    assert_redirected_to config_path(assigns(:config))
  end

  test "should show config" do
    get :show, :id => configs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => configs(:one).id
    assert_response :success
  end

  test "should update config" do
    put :update, :id => configs(:one).id, :config => { }
    assert_redirected_to config_path(assigns(:config))
  end

  test "should destroy config" do
    assert_difference('Config.count', -1) do
      delete :destroy, :id => configs(:one).id
    end

    assert_redirected_to configs_path
  end
end
