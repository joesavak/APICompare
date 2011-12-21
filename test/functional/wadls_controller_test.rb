require 'test_helper'

class WadlsControllerTest < ActionController::TestCase
  setup do
    @wadl = wadls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wadls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wadl" do
    assert_difference('Wadl.count') do
      post :create, wadl: @wadl.attributes
    end

    assert_redirected_to wadl_path(assigns(:wadl))
  end

  test "should show wadl" do
    get :show, id: @wadl.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wadl.to_param
    assert_response :success
  end

  test "should update wadl" do
    put :update, id: @wadl.to_param, wadl: @wadl.attributes
    assert_redirected_to wadl_path(assigns(:wadl))
  end

  test "should destroy wadl" do
    assert_difference('Wadl.count', -1) do
      delete :destroy, id: @wadl.to_param
    end

    assert_redirected_to wadls_path
  end
end
