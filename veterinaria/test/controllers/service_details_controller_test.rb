require 'test_helper'

class ServiceDetailsControllerTest < ActionController::TestCase
  setup do
    @service_detail = service_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_detail" do
    assert_difference('ServiceDetail.count') do
      post :create, service_detail: { product_id: @service_detail.product_id, quantity: @service_detail.quantity, service_id: @service_detail.service_id }
    end

    assert_redirected_to service_detail_path(assigns(:service_detail))
  end

  test "should show service_detail" do
    get :show, id: @service_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_detail
    assert_response :success
  end

  test "should update service_detail" do
    patch :update, id: @service_detail, service_detail: { product_id: @service_detail.product_id, quantity: @service_detail.quantity, service_id: @service_detail.service_id }
    assert_redirected_to service_detail_path(assigns(:service_detail))
  end

  test "should destroy service_detail" do
    assert_difference('ServiceDetail.count', -1) do
      delete :destroy, id: @service_detail
    end

    assert_redirected_to service_details_path
  end
end
