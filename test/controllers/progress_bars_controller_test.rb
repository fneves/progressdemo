require 'test_helper'

class ProgressBarsControllerTest < ActionController::TestCase
  setup do
    @progress_bar = progress_bars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progress_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create progress_bar" do
    assert_difference('ProgressBar.count') do
      post :create, progress_bar: { name: @progress_bar.name }
    end

    assert_redirected_to progress_bar_path(assigns(:progress_bar))
  end

  test "should show progress_bar" do
    get :show, id: @progress_bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @progress_bar
    assert_response :success
  end

  test "should update progress_bar" do
    patch :update, id: @progress_bar, progress_bar: { name: @progress_bar.name }
    assert_redirected_to progress_bar_path(assigns(:progress_bar))
  end

  test "should destroy progress_bar" do
    assert_difference('ProgressBar.count', -1) do
      delete :destroy, id: @progress_bar
    end

    assert_redirected_to progress_bars_path
  end
end
