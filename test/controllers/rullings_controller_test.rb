require 'test_helper'

class RullingsControllerTest < ActionController::TestCase
  setup do
    @rulling = rullings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rullings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rulling" do
    assert_difference('Rulling.count') do
      post :create, rulling: { description: @rulling.description, objective: @rulling.objective, title: @rulling.title }
    end

    assert_redirected_to rulling_path(assigns(:rulling))
  end

  test "should show rulling" do
    get :show, id: @rulling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rulling
    assert_response :success
  end

  test "should update rulling" do
    patch :update, id: @rulling, rulling: { description: @rulling.description, objective: @rulling.objective, title: @rulling.title }
    assert_redirected_to rulling_path(assigns(:rulling))
  end

  test "should destroy rulling" do
    assert_difference('Rulling.count', -1) do
      delete :destroy, id: @rulling
    end

    assert_redirected_to rullings_path
  end
end
