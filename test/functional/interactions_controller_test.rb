require 'test_helper'

class InteractionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interaction" do
    assert_difference('Interaction.count') do
      post :create, :interaction => { }
    end

    assert_redirected_to interaction_path(assigns(:interaction))
  end

  test "should show interaction" do
    get :show, :id => interactions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => interactions(:one).to_param
    assert_response :success
  end

  test "should update interaction" do
    put :update, :id => interactions(:one).to_param, :interaction => { }
    assert_redirected_to interaction_path(assigns(:interaction))
  end

  test "should destroy interaction" do
    assert_difference('Interaction.count', -1) do
      delete :destroy, :id => interactions(:one).to_param
    end

    assert_redirected_to interactions_path
  end
end
