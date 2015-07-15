require 'test_helper'

class ViaticosControllerTest < ActionController::TestCase
  setup do
    @viatico = viaticos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viaticos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viatico" do
    assert_difference('Viatico.count') do
      post :create, viatico: { cantidad: @viatico.cantidad, proyect_id: @viatico.proyect_id, user_id: @viatico.user_id }
    end

    assert_redirected_to viatico_path(assigns(:viatico))
  end

  test "should show viatico" do
    get :show, id: @viatico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @viatico
    assert_response :success
  end

  test "should update viatico" do
    patch :update, id: @viatico, viatico: { cantidad: @viatico.cantidad, proyect_id: @viatico.proyect_id, user_id: @viatico.user_id }
    assert_redirected_to viatico_path(assigns(:viatico))
  end

  test "should destroy viatico" do
    assert_difference('Viatico.count', -1) do
      delete :destroy, id: @viatico
    end

    assert_redirected_to viaticos_path
  end
end
