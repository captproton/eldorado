require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class CategoriesControllerTest < Test::Unit::TestCase
  fixtures :all

  def setup
    @controller = CategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_not_get_index
    get :index
    assert_redirected_to forum_root_path
    login_as :Administrator
    get :index
    assert_redirected_to forum_root_path
    login_as :trevor
    get :index
    assert_redirected_to forum_root_path
  end
  
  def test_should_get_new_if_admin
    login_as :Administrator
    get :new
    assert_response :success
  end
  
  def test_should_not_get_new_if_not_admin_or_not_logged_in
    get :new
    assert_redirected_to root_path
    login_as :trevor
    get :new
    assert_redirected_to root_path
  end

  def test_should_create_category_if_admin
    login_as :Administrator
    old_count = Category.count
    post :create, :category => {:name => 'test', :position => 0}
    assert_equal old_count+1, Category.count
  end
  
  def test_should_not_create_category_if_not_admin_or_not_logged_in
    old_count = Category.count
    post :create, :category => {:name => 'test', :position => 0}
    assert_redirected_to root_path
    assert_equal old_count, Category.count
    login_as :trevor
    post :create, :category => {:name => 'test', :position => 0}
    assert_redirected_to root_path
    assert_equal old_count, Category.count
  end

  def test_should_show_category
    get :show, :id => 1
    assert_response :success
    login_as :trevor
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit_if_admin
    login_as :Administrator
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_not_get_edit_if_not_admin_or_not_logged_in
    get :edit, :id => 1
    assert_redirected_to root_path
    login_as :trevor
    get :edit, :id => 1
    assert_redirected_to root_path
  end
  
  def test_should_update_category_if_admin
    login_as :Administrator
    put :update, :id => 1, :category => { :id => 1, :name => 'update works!' }
    categories(:one).reload
    assert_redirected_to category_path(categories(:one))
    assert_equal categories(:one).name, 'update works!'
  end
  
  def test_should_not_update_category_if_not_admin_or_not_logged_in
    get :edit, :id => 1
    assert_redirected_to root_path
    login_as :trevor
    get :edit, :id => 1
    assert_redirected_to root_path
  end
  
  def test_should_destroy_category
  end
end
