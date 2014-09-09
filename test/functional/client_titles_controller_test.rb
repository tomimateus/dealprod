require 'test_helper'

class ClientTitlesControllerTest < ActionController::TestCase
  setup do
    @client_title = client_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_title" do
    assert_difference('ClientTitle.count') do
      post :create, client_title: { client_id: @client_title.client_id, title_id: @client_title.title_id }
    end

    assert_redirected_to client_title_path(assigns(:client_title))
  end

  test "should show client_title" do
    get :show, id: @client_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_title
    assert_response :success
  end

  test "should update client_title" do
    put :update, id: @client_title, client_title: { client_id: @client_title.client_id, title_id: @client_title.title_id }
    assert_redirected_to client_title_path(assigns(:client_title))
  end

  test "should destroy client_title" do
    assert_difference('ClientTitle.count', -1) do
      delete :destroy, id: @client_title
    end

    assert_redirected_to client_titles_path
  end
end
