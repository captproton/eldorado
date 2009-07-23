require 'test_helper'

class HappeningsControllerTest < ActionController::TestCase

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:happenings)
  end

  # def test_should_get_new
  # end
  
  def test_should_create_happening
    login_as :trevor
    old_count = Happening.count
    post :create, :happening => {:title => "test", :description => "test", :date => Time.now.utc }
    assert_equal old_count+1, Happening.count
    assert_redirected_to happening_path(assigns(:happening))
  end

  def test_should_show_happening
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit_or_perform_update_if_admin
    login_as :Administrator
    get :edit, :id => 1
    assert_response :success
    put :update, :id => 1, :happening => {:title => "test", :description => "test", :date => Time.now.utc}
    assert_redirected_to happening_path(assigns(:happening))
  end
  
  def test_should_get_edit_or_perform_update_if_user_that_made_it
    login_as :trevor
    get :edit, :id => 1
    assert_response :success
    put :update, :id => 1, :happening => {:title => "test", :description => "test", :date => Time.now.utc}
    assert_redirected_to happening_path(assigns(:happening))
  end
  
  def test_should_not_get_edit_or_perform_update_if_not_logged_in
    get :edit, :id => 1
    assert_redirected_to login_path
    put :update, :id => 1, :happening => {:title => "test", :description => "test", :date => Time.now.utc}
    assert_redirected_to login_path
  end
  
  def test_should_not_get_edit_or_perform_update_if_not_authorized
    login_as :Timothy
    get :edit, :id => 1
    assert_redirected_to root_path
    put :update, :id => 1, :happening => {:title => "test", :description => "test", :date => Time.now.utc}
    assert_redirected_to root_path
  end
  
  def test_should_update_happening
    login_as :Administrator
    put :update, :id => 1, :happening => {:title => "test", :description => "test", :date => Time.now.utc}
    assert_redirected_to happening_path(assigns(:happening))
  end
  
  def test_should_destroy_happening_if_creator
    old_count = Happening.count
    login_as :trevor
    delete :destroy, :id => 1
    assert_equal old_count-1, Happening.count
    assert_redirected_to happenings_path
  end
  
  def test_should_destroy_happening_if_admin
    old_count = Happening.count
    login_as :Administrator
    delete :destroy, :id => 1
    assert_equal old_count-1, Happening.count
    assert_redirected_to happenings_path
  end
  
  def test_should_not_destroy_happening_if_not_authorized
    old_count = Happening.count
    delete :destroy, :id => 1
    assert_equal old_count, Happening.count
    assert_redirected_to login_path
    login_as :Timothy
    delete :destroy, :id => 1
    assert_equal old_count, Happening.count
    assert_redirected_to login_path
  end
  
  # def test_should_create_happening_with_correct_time_for_user_time_zone
  # end
  
  # def test_should_show_reminder_on_correct_date_for_current_user
  # end
end
