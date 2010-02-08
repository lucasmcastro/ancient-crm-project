require 'test_helper'

class IssueStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_status" do
    assert_difference('IssueStatus.count') do
      post :create, :issue_status => { }
    end

    assert_redirected_to issue_status_path(assigns(:issue_status))
  end

  test "should show issue_status" do
    get :show, :id => issue_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => issue_statuses(:one).to_param
    assert_response :success
  end

  test "should update issue_status" do
    put :update, :id => issue_statuses(:one).to_param, :issue_status => { }
    assert_redirected_to issue_status_path(assigns(:issue_status))
  end

  test "should destroy issue_status" do
    assert_difference('IssueStatus.count', -1) do
      delete :destroy, :id => issue_statuses(:one).to_param
    end

    assert_redirected_to issue_statuses_path
  end
end
