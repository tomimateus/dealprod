require 'test_helper'

class ClientsOffersControllerTest < ActionController::TestCase
  setup do
    @clients_offer = clients_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clients_offer" do
    assert_difference('ClientsOffer.count') do
      post :create, clients_offer: { client_id: @clients_offer.client_id, offer_id: @clients_offer.offer_id, participated: @clients_offer.participated, position: @clients_offer.position }
    end

    assert_redirected_to clients_offer_path(assigns(:clients_offer))
  end

  test "should show clients_offer" do
    get :show, id: @clients_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clients_offer
    assert_response :success
  end

  test "should update clients_offer" do
    put :update, id: @clients_offer, clients_offer: { client_id: @clients_offer.client_id, offer_id: @clients_offer.offer_id, participated: @clients_offer.participated, position: @clients_offer.position }
    assert_redirected_to clients_offer_path(assigns(:clients_offer))
  end

  test "should destroy clients_offer" do
    assert_difference('ClientsOffer.count', -1) do
      delete :destroy, id: @clients_offer
    end

    assert_redirected_to clients_offers_path
  end
end
