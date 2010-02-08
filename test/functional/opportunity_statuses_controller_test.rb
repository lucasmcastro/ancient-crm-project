require 'test_helper'

class OpportunityStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunity_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity_status" do
    assert_difference('OpportunityStatus.count') do
      post :create, :opportunity_status => { }
    end

    assert_redirected_to opportunity_status_path(assigns(:opportunity_status))
  end

  test "should show opportunity_status" do
    get :show, :id => opportunity_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => opportunity_statuses(:one).to_param
    assert_response :success
  end

  test "should update opportunity_status" do
    put :update, :id => opportunity_statuses(:one).to_param, :opportunity_status => { }
    assert_redirected_to opportunity_status_path(assigns(:opportunity_status))
  end

  test "should destroy opportunity_status" do
    assert_difference('OpportunityStatus.count', -1) do
      delete :destroy, :id => opportunity_statuses(:one).to_param
    end

    assert_redirected_to opportunity_statuses_path
  end
end
