require 'test_helper'

class ServiceOrderDetailsControllerTest < ActionController::TestCase
  setup do
    @service_order_detail = service_order_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_order_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_order_detail" do
    assert_difference('ServiceOrderDetail.count') do
      post :create, service_order_detail: { product_id: @service_order_detail.product_id, quantity: @service_order_detail.quantity, service_order_id: @service_order_detail.service_order_id }
    end

    assert_redirected_to service_order_detail_path(assigns(:service_order_detail))
  end

  test "should show service_order_detail" do
    get :show, id: @service_order_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_order_detail
    assert_response :success
  end

  test "should update service_order_detail" do
    patch :update, id: @service_order_detail, service_order_detail: { product_id: @service_order_detail.product_id, quantity: @service_order_detail.quantity, service_order_id: @service_order_detail.service_order_id }
    assert_redirected_to service_order_detail_path(assigns(:service_order_detail))
  end

  test "should destroy service_order_detail" do
    assert_difference('ServiceOrderDetail.count', -1) do
      delete :destroy, id: @service_order_detail
    end

    assert_redirected_to service_order_details_path
  end
end
