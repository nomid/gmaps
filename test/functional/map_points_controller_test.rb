require 'test_helper'

class MapPointsControllerTest < ActionController::TestCase
  setup do
    @map_point = map_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:map_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create map_point" do
    assert_difference('MapPoint.count') do
      post :create, map_point: @map_point.attributes
    end

    assert_redirected_to map_point_path(assigns(:map_point))
  end

  test "should show map_point" do
    get :show, id: @map_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @map_point
    assert_response :success
  end

  test "should update map_point" do
    put :update, id: @map_point, map_point: @map_point.attributes
    assert_redirected_to map_point_path(assigns(:map_point))
  end

  test "should destroy map_point" do
    assert_difference('MapPoint.count', -1) do
      delete :destroy, id: @map_point
    end

    assert_redirected_to map_points_path
  end
end
