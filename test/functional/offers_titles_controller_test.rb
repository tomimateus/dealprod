require 'test_helper'

class OffersTitlesControllerTest < ActionController::TestCase
  setup do
    @offers_title = offers_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offers_title" do
    assert_difference('OffersTitle.count') do
      post :create, offers_title: { offer_id: @offers_title.offer_id, title_id: @offers_title.title_id }
    end

    assert_redirected_to offers_title_path(assigns(:offers_title))
  end

  test "should show offers_title" do
    get :show, id: @offers_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offers_title
    assert_response :success
  end

  test "should update offers_title" do
    put :update, id: @offers_title, offers_title: { offer_id: @offers_title.offer_id, title_id: @offers_title.title_id }
    assert_redirected_to offers_title_path(assigns(:offers_title))
  end

  test "should destroy offers_title" do
    assert_difference('OffersTitle.count', -1) do
      delete :destroy, id: @offers_title
    end

    assert_redirected_to offers_titles_path
  end
end
