require 'test_helper'

class ServiceOrdersControllerTest < ActionController::TestCase
  setup do
    @service_order = service_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_order" do
    assert_difference('ServiceOrder.count') do
      post :create, service_order: { citation_id: @service_order.citation_id }
    end

    assert_redirected_to service_order_path(assigns(:service_order))
  end

  test "should show service_order" do
    get :show, id: @service_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_order
    assert_response :success
  end

  test "should update service_order" do
    patch :update, id: @service_order, service_order: { citation_id: @service_order.citation_id }
    assert_redirected_to service_order_path(assigns(:service_order))
  end

  test "should destroy service_order" do
    assert_difference('ServiceOrder.count', -1) do
      delete :destroy, id: @service_order
    end

    assert_redirected_to service_orders_path
  end
end
