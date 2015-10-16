require 'test_helper'

class MootsControllerTest < ActionController::TestCase
  setup do
    @moot = moots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moot" do
    assert_difference('Moot.count') do
      post :create, moot: { description: @moot.description, title: @moot.title, voting_ending_at: @moot.voting_ending_at, voting_start_at: @moot.voting_start_at }
    end

    assert_redirected_to moot_path(assigns(:moot))
  end

  test "should show moot" do
    get :show, id: @moot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moot
    assert_response :success
  end

  test "should update moot" do
    patch :update, id: @moot, moot: { description: @moot.description, title: @moot.title, voting_ending_at: @moot.voting_ending_at, voting_start_at: @moot.voting_start_at }
    assert_redirected_to moot_path(assigns(:moot))
  end

  test "should destroy moot" do
    assert_difference('Moot.count', -1) do
      delete :destroy, id: @moot
    end

    assert_redirected_to moots_path
  end
end
