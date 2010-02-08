require 'test_helper'

class OpportunitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity" do
    assert_difference('Opportunity.count') do
      post :create, :opportunity => { }
    end

    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test "should show opportunity" do
    get :show, :id => opportunities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => opportunities(:one).to_param
    assert_response :success
  end

  test "should update opportunity" do
    put :update, :id => opportunities(:one).to_param, :opportunity => { }
    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test "should destroy opportunity" do
    assert_difference('Opportunity.count', -1) do
      delete :destroy, :id => opportunities(:one).to_param
    end

    assert_redirected_to opportunities_path
  end
end
