require 'test_helper'

class CitationDetailsControllerTest < ActionController::TestCase
  setup do
    @citation_detail = citation_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:citation_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create citation_detail" do
    assert_difference('CitationDetail.count') do
      post :create, citation_detail: { amount: @citation_detail.amount, citation_id: @citation_detail.citation_id, client_id: @citation_detail.client_id, quantity: @citation_detail.quantity }
    end

    assert_redirected_to citation_detail_path(assigns(:citation_detail))
  end

  test "should show citation_detail" do
    get :show, id: @citation_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @citation_detail
    assert_response :success
  end

  test "should update citation_detail" do
    patch :update, id: @citation_detail, citation_detail: { amount: @citation_detail.amount, citation_id: @citation_detail.citation_id, client_id: @citation_detail.client_id, quantity: @citation_detail.quantity }
    assert_redirected_to citation_detail_path(assigns(:citation_detail))
  end

  test "should destroy citation_detail" do
    assert_difference('CitationDetail.count', -1) do
      delete :destroy, id: @citation_detail
    end

    assert_redirected_to citation_details_path
  end
end
