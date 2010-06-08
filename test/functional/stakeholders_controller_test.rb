require 'test_helper'

class StakeholdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stakeholders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stakeholder" do
    assert_difference('Stakeholder.count') do
      post :create, :stakeholder => { }
    end

    assert_redirected_to stakeholder_path(assigns(:stakeholder))
  end

  test "should show stakeholder" do
    get :show, :id => stakeholders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stakeholders(:one).to_param
    assert_response :success
  end

  test "should update stakeholder" do
    put :update, :id => stakeholders(:one).to_param, :stakeholder => { }
    assert_redirected_to stakeholder_path(assigns(:stakeholder))
  end

  test "should destroy stakeholder" do
    assert_difference('Stakeholder.count', -1) do
      delete :destroy, :id => stakeholders(:one).to_param
    end

    assert_redirected_to stakeholders_path
  end
end
