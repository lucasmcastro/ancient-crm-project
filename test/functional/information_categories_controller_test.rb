require 'test_helper'

class InformationCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:information_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create information_category" do
    assert_difference('InformationCategory.count') do
      post :create, :information_category => { }
    end

    assert_redirected_to information_category_path(assigns(:information_category))
  end

  test "should show information_category" do
    get :show, :id => information_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => information_categories(:one).to_param
    assert_response :success
  end

  test "should update information_category" do
    put :update, :id => information_categories(:one).to_param, :information_category => { }
    assert_redirected_to information_category_path(assigns(:information_category))
  end

  test "should destroy information_category" do
    assert_difference('InformationCategory.count', -1) do
      delete :destroy, :id => information_categories(:one).to_param
    end

    assert_redirected_to information_categories_path
  end
end
